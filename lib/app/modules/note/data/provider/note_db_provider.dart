import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tp_final/app/modules/note/model/note_model.dart';

class NoteDbProvider {
  static final _databaseName = "my_note.db";
  static final _databaseVersion = 1;
  static final table = 'note';

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table(
      ${Note.cId} INTEGER PRIMARY KEY,
      ${Note.cTitle} TEXT NOT NULL,
      ${Note.cDate} TEXT,
      ${Note.cContenu} TEXT,
      ${Note.cPicturePath} TEXT 
    )
    ''');
  }

  Future<int> insert(Map<String, dynamic> data) async {
    Database? db = await database;
    return await db!.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query() async {
    Database? db = await database;
    return db!.query(table);
  }

  Future<int> update(Map<String, dynamic> data) async {
    Database? db = await database;
    int id = data[Note.cId];
    return await db!
        .update(table, data, where: '${Note.cId} = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database? db = await database;
    return await db!.delete(table, where: '${Note.cId} = ?', whereArgs: [id]);
  }
}
