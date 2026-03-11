import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  var databaseFactory = databaseFactoryFfi;
  
  var dbPath = 'assets/db/rvr1960.sqlite';
  var db = await databaseFactory.openDatabase(dbPath);

  // Obtener nombres de las tablas
  var tables = await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table';");
  print("--- TABLAS ---");
  for (var t in tables) {
    print(t['name']);
  }

  // Describir cada tabla si no son muchas, o la primera si hay muchas
  if (tables.isNotEmpty) {
      String firstTable = tables.first['name'] as String;
      print("\n--- ESTRUCTURA DE $firstTable ---");
      var columns = await db.rawQuery("PRAGMA table_info($firstTable);");
      for (var col in columns) {
        print("${col['name']} - ${col['type']}");
      }
      
      print("\n--- EJEMPLO DE DATOS DE $firstTable ---");
      var data = await db.query(firstTable, limit: 1);
      print(data);
  }

  await db.close();
}
