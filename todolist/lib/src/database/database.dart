// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/src/model/note_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _database;

  DatabaseHelper._instance();

  String noteTable = 'note_table';
  String columnId = 'id';
  String columnTitle = 'title';
  String columnDescription = 'description';
  String columnDeadline = 'deadline';
  String columnStatus = 'status';

  /*
  This is how our note table with look
  ID | Title | Description | Deadline |  Status
  0  |  ""   |      ""     |    ""    |   0
  1  |  ""   |      ""     |    ""    |   1
  .  |  ""   |      ""     |   ""     |   .
   */

  Future<Database?> get database async {
    _database ??= await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todo_list.db';
    final todoListDatabase =
        await openDatabase(path, version: 1, onCreate: _createDatabase);

    return todoListDatabase;
  }

  void _createDatabase(Database database, int version) async {
    await database.execute(
        'CREATE TABLE $noteTable($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnTitle TEXT, $columnDescription TEXT, $columnDeadline TEXT, $columnStatus INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database? database = await this.database;
    final List<Map<String, dynamic>> result = await database!.query(noteTable);
    return result;
  }

  Future<List<Note>> getNoteList() async {
    final List<Map<String, dynamic>> noteMapList = await getNoteMapList();
    final List<Note> noteList = [];
    noteMapList.forEach((noteMap) {
      noteList.add(Note.fromMap(noteMap));
    });
    noteList.sort(
      (noteA, noteB) => noteA.deadline!.compareTo(noteB.deadline!),
    );
    return noteList;
  }

  Future<int> insertNote(Note note) async {
    Database? database = await this.database;
    final int result = await database!.insert(
      noteTable,
      note.toMap(),
    );
    return result;
  }

  Future<int> updateNote(Note note) async {
    Database? database = await this.database;
    final int result = await database!.update(
      noteTable,
      note.toMap(),
      where: '$columnId = ?',
      whereArgs: [note.id],
    );
    return result;
  }

  Future<int> deleteNote(int id) async {
    Database? database = await this.database;
    final int result = await database!.delete(
      noteTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
