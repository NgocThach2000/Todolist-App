import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:todolist/src/model/todo_model.dart';
import 'package:todolist/src/model/note_model.dart';
import 'package:todolist/src/database/database.dart';

class TodoController extends ControllerMVC {
  factory TodoController([StateMVC? state]) =>
      _this ??= TodoController._(state);
  TodoController._(StateMVC? state) : super(state);

  static TodoController? _this;

  //getter - setter
  DateFormat get dateFormatter => TodoModel.dateFormatter;
  Future<List<Note>>? get noteList => TodoModel.noteList;

  void updateNoteList() {
    TodoModel.updateNoteList();
  }

  Future<int> updatedNote(Note note) async => TodoModel.updatedNote(note);
  Future<int> insertedNote(Note note) async => TodoModel.insertedNote(note);
  Future<int> deletedNote(int id) async => TodoModel.deletedNote(id);
}
