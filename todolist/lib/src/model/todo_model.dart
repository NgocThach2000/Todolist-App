import 'package:intl/intl.dart';
import 'note_model.dart';
import 'package:todolist/src/database/database.dart';

abstract class TodoModel {
  static Future<List<Note>>? _noteList;
  static final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  static final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  //getter - setter
  static DateFormat get dateFormatter => _dateFormatter;
  static Future<List<Note>>? get noteList => _noteList;
  static DatabaseHelper get databaseHelper => _databaseHelper;

  static void updateNoteList() {
    _noteList = _databaseHelper.getNoteList();
  }

  static Future<int> updatedNote(Note note) async =>
      await _databaseHelper.updateNote(note);

  static Future<int> insertedNote(Note note) async =>
      await _databaseHelper.insertNote(note);

  static Future<int> deletedNote(int id) async =>
      await _databaseHelper.deleteNote(id);
}
