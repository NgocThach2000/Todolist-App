import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:intl/intl.dart';
import 'package:todolist/src/app_view.dart';
import 'package:todolist/src/database/database.dart';
import 'package:todolist/src/model/note_model.dart';
import 'package:todolist/src/model/add_note_model.dart';
import 'package:todolist/src/view/add_note_veiw.dart';

class AddNoteController extends ControllerMVC {
  factory AddNoteController([StateMVC? state]) =>
      _this ??= AddNoteController._(state);

  AddNoteController._(StateMVC? state) : super(state);
  static AddNoteController? _this;

  get formKey => AddNoteModel.formKey;
  String get title => AddNoteModel.title;
  String get description => AddNoteModel.description;
  String get btnTextSave => AddNoteModel.btnTextSave;
  String get titleText => AddNoteModel.titleText;
  DateTime? get deadline => AddNoteModel.deadline;
  TextEditingController get deadlineController =>
      AddNoteModel.deadlineController;
  DateFormat get dateFormatter => AddNoteModel.dateFormatter;
  DatabaseHelper get databaseHelper => AddNoteModel.databaseHelper;

  set title(String value) => AddNoteModel.title = value;
  set description(String value) => AddNoteModel.description = value;
  set btnTextSave(String value) => AddNoteModel.btnTextSave = value;
  set titleText(String value) => AddNoteModel.titleText = value;
  set deadline(DateTime? value) => AddNoteModel.deadline = value;

  Future<int> insertedNote(Note note) async => AddNoteModel.insertedNote(note);
  Future<int> updatedNote(Note note) async => AddNoteModel.updatedNote(note);
  Future<int> deletedNote(int id) async => AddNoteModel.deletedNote(id);

  void changeNoteButton(AddNoteView widget) {
    // ignore: unnecessary_null_comparison
    if (widget.note != null) {
      title = widget.note!.title!;
      description = widget.note!.description!;
      btnTextSave = 'Update Note';
      titleText = 'Change Note';
    } else {
      btnTextSave = 'Add Note';
      titleText = 'New Note';
    }
    deadlineController.text = dateFormatter.format(deadline!);
  }

  void handleDataPicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: deadline!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != deadline) {
      deadline = date;
      deadlineController.text = dateFormatter.format(deadline!);
    }
  }

  void delete(BuildContext context, AddNoteView widget) {
    databaseHelper.deleteNote(widget.note!.id!);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => App(
          selectedIndexPage: widget.saveIndex!,
        ),
      ),
    );
    widget.updateNoteList!;
  }

  void submit(BuildContext context, AddNoteView widget) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Note note = Note(
        title: title.toUpperCase(),
        description: description,
        deadline: deadline,
      );
      if (widget.note == null) {
        note.status = 0;
        insertedNote(note);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => App(
              selectedIndexPage: widget.saveIndex!,
            ),
          ),
        );
        // Navigator.pop(context);
      } else {
        note.id = widget.note!.id;
        note.status = widget.note!.status;
        updatedNote(note);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => App(
              selectedIndexPage: widget.saveIndex!,
            ),
          ),
        );
        // Navigator.pop(context);
      }
      widget.updateNoteList!();
    }
  }

  void disposed() {
    title = '';
    deadline = DateTime.now();
    description = '';
  }
}
