import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'user.dart';

/*
THIS IS ONLY IF YOU NEED LOCAL DATABASE

Caution: All data will be erased when restarting the app in Intellij.
Alternative: Refer Httpclient.dart

 */

/**
  In Main.dart
    // var db = DB();
    // await db.open();
    // print(await db.scores('admin1@gmail.com'));

    Depedencies
    sqflite: ^2.3.0
    sqflite_common_ffi: ^2.3.0+2
    path: ^1.8.3
    sqflite_common_ffi_web: ^0.4.0

 */
//https://pub.dev/packages/sqflite_common_ffi_web
var _database;

class DB {

  Future<void> open() async {
    WidgetsFlutterBinding.ensureInitialized();
    databaseFactory = databaseFactoryFfiWeb;

    _database = await databaseFactory.openDatabase('quiz.db');
      await _database.execute(
      'CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, score INT, created_at DATETIME DEFAULT CURRENT_TIMESTAMP)'
      );
 }

  Future<void> insert(QUser user) async {
    final db = await _database;

    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<QUser>> scores(String name) async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * from users where name='$name' ORDER BY created_at desc");

    return List.generate(maps.length, (i) {
      return QUser(
        name: maps[i]['name'] as String,
        score: maps[i]['score'] as int,
      );
    });
  }
}
