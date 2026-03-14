import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Verse {
  final int id;
  final int bookId;
  final int chapter;
  final int verse;
  final String text;
  final String bookName;

  Verse({
    required this.id,
    required this.bookId,
    required this.chapter,
    required this.verse,
    required this.text,
    required this.bookName,
  });

  factory Verse.fromMap(Map<String, dynamic> map) {
    return Verse(
      id: map['id'] as int,
      bookId: map['book_id'] as int,
      chapter: map['chapter'] as int,
      verse: map['verse'] as int,
      text: map['text'] as String,
      bookName: map['book_name'] as String? ?? '', // Viniendo del JOIN
    );
  }
}

class DatabaseHelper {
  // Inicializa la tabla de usuarios si no existe
  static Future<void> initUserTable() async {
    final db = await getDatabase();
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
      )
    ''');
    
    await db.execute('''
      CREATE TABLE IF NOT EXISTS user_stats (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        streak_days INTEGER DEFAULT 1,
        verses_read INTEGER DEFAULT 0,
        app_time_minutes INTEGER DEFAULT 0,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');
  }

  // Registra un usuario nuevo, retorna true si fue exitoso, false si el usuario ya existe
  static Future<bool> registerUser(String username, String password) async {
    await initUserTable();
    final db = await getDatabase();
    // Verifica si ya existe
    final existing = await db.query('users', where: 'username = ?', whereArgs: [username]);
    if (existing.isNotEmpty) return false;
    
    int newId = await db.insert('users', {'username': username, 'password': password});
    // Seed blank user stats
    await db.insert('user_stats', {'user_id': newId, 'streak_days': 1, 'verses_read': 0, 'app_time_minutes': 0});
    return true;
  }

  // Obtiene estadisticas de un usuario
  static Future<Map<String, dynamic>> getUserStats(int userId) async {
    await initUserTable();
    final db = await getDatabase();
    final res = await db.query('user_stats', where: 'user_id = ?', whereArgs: [userId]);
    if (res.isNotEmpty) {
      return res.first;
    }
    return {'streak_days': 0, 'verses_read': 0, 'app_time_minutes': 0};
  }

  // Obtiene un usuario por nombre de usuario
  static Future<Map<String, dynamic>?> getUser(String username) async {
    final db = await getDatabase();
    final existing = await db.query('users', where: 'username = ?', whereArgs: [username]);
    if (existing.isNotEmpty) {
      return existing.first;
    }
    return null;
  }

  // Actualiza un usuario (cambia el username y/o password)
  // Retorna true si fue exitoso, false si el nuevo username ya existe (y no es el mismo)
  static Future<bool> updateUser(String oldUsername, String newUsername, String newPassword) async {
    final db = await getDatabase();
    
    // Si están cambiando el username, verifica que el nuevo no exista
    if (oldUsername != newUsername) {
       final existing = await db.query('users', where: 'username = ?', whereArgs: [newUsername]);
       if (existing.isNotEmpty) return false;
    }

    int rows = await db.update(
      'users', 
      {'username': newUsername, 'password': newPassword},
      where: 'username = ?',
      whereArgs: [oldUsername]
    );

    return rows > 0;
  }
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    // Manejo exclusivo para la Web (Chrome/Edge)
    if (kIsWeb) {
      var factory = databaseFactoryFfiWeb;
      // var path = 'assets/db/rvr1960.sqlite'; // En web se lee directo con HTTP
      
      // En Web no podemos copiar a archivos locales como File(path).writeAsBytes
      // Sqflite FFI Web maneja los assets si referenciamos correctamente, o la abrimos
      // Para web con la base pre-cargada es algo más complejo, 
      // Si usas un asset pre-empaquetado lo podemos abrir "en memoria":
      
      // Leemos buffer 
      ByteData data = await rootBundle.load(join("assets", "db", "rvr1960.sqlite"));
      // List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      
      return await factory.openDatabase(
        inMemoryDatabasePath, 
        options: OpenDatabaseOptions(
          singleInstance: true,
          onOpen: (db) async {
            // Simulamos escribir los bytes con una implementación ficticia de FFI,
            // pero para esto es mejor directamente avisarle al usuario que corra en Desktop.
          }
        ),
      );
    }
    
    // Configuración para Desktop si corre en Windows nativo
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "rvr1960.sqlite");

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "db", "rvr1960.sqlite"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      print("Escribiendo base de datos a memoria en: $path");
      await File(path).writeAsBytes(bytes, flush: true);
    } 

    return await openDatabase(path);
  }

  // Obtiene un versículo específico (usado para el "Versículo Diario")
  static Future<Verse?> getVerse(int bookId, int chapter, int verseNumber) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT v.*, b.name as book_name 
      FROM verse v 
      JOIN book b ON v.book_id = b.id 
      WHERE v.book_id = ? AND v.chapter = ? AND v.verse = ?
      LIMIT 1
    ''', [bookId, chapter, verseNumber]);

    if (maps.isNotEmpty) {
      Verse v = Verse.fromMap(maps.first);
      // Limpieza de marcadores acrósticos hebreos o espacios (como "Nun " antes del Salmo 119:105)
      // SQLite en Biblias a veces los codifica con varios espacios y el texto
      String cleanedText = v.text.replaceAll(RegExp(r'^\s*([A-Za-z]+)\s+'), '').trim();
      
      // Si el texto se vació por error, restauramos el original
      if (cleanedText.isEmpty) cleanedText = v.text.trim();

      return Verse(
        id: v.id,
        bookId: v.bookId,
        chapter: v.chapter,
        verse: v.verse,
        text: cleanedText,
        bookName: v.bookName,
      );
    }
    return null;
  }

  // Obtiene todos los versículos de un capítulo
  static Future<List<Verse>> getChapter(int bookId, int chapter) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT v.*, b.name as book_name 
      FROM verse v 
      JOIN book b ON v.book_id = b.id 
      WHERE v.book_id = ? AND v.chapter = ?
      ORDER BY v.verse ASC
    ''', [bookId, chapter]);

    return List.generate(maps.length, (i) {
      return Verse.fromMap(maps[i]);
    });
  }

  // Obtiene la máxima cantidad de capítulos que tiene un libro
  static Future<int> getMaxChapters(int bookId) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> res = await db.rawQuery(
      'SELECT MAX(chapter) as max_chapters FROM verse WHERE book_id = ?', 
      [bookId]
    );
    if (res.isNotEmpty && res.first['max_chapters'] != null) {
      return res.first['max_chapters'] as int;
    }
    return 1;
  }
  
  // Obtiene nombres de libros para la UI
  static Future<List<Map<String, dynamic>>> getBooks() async {
    final db = await getDatabase();
    return await db.query('book', orderBy: 'id ASC');
  }
}
