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

  // Busca una palabra en toda la Biblia
  static Future<List<Verse>> searchBible(String keyword) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT v.*, b.name as book_name 
      FROM verse v 
      JOIN book b ON v.book_id = b.id 
      WHERE v.text LIKE ?
      ORDER BY v.book_id ASC, v.chapter ASC, v.verse ASC
    ''', ['%$keyword%']);

    return List.generate(maps.length, (i) {
      return Verse.fromMap(maps[i]);
    });
  }
}
