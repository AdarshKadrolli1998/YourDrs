import 'dart:io';
import 'package:YOURDRS_FlutterAPP/data/model/audio.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;
  static final DatabaseHelper db = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the User table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'audio_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Audio('
              'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
              'audioFile BLOB'
              ')');
        });
  }

  // Insert Audio
  insertAudio(Audio newAudio) async {
    // await deleteAllAudios();
    final db = await database;
    final res = await db.insert('Audio', {
      // 'id': newAudio.id,
      'audioFile': newAudio.audioFile
    });
    print("insertAudio $res ${newAudio.audioFile.length}");
    return res;
  }

  // Delete all Audios
  Future<int> deleteAllAudios() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Audio');

    return res;
  }

  // Future<int> updateAudios() async {
  //   final db = await database;
  //   final updateRes = await db.rawUpdate("UPDATE User SET username = 'John' WHERE id = 1");
  //   print(updateRes);
  //   return updateRes;
  // }

  Future<List<Audio>> getAllAudios() async {
    final db = await database;
    // final res = await db.rawQuery("SELECT * FROM EMPLOYEE");
    final res = await db.rawQuery(
        "SELECT * FROM Audio");

    // print('data is saving $res');

    List<Audio> list = res.isNotEmpty
        ? res.map((c) {
      print('res.map $c');

      final user = Audio.fromMap(c);
      return user;
    }).toList() : [];
    print(list);
    return list;

  }
}
