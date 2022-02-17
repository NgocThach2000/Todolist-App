// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/src/database/database.dart';
import 'package:todolist/src/model/note_model.dart';

class AddNoteModel {
  static final _formKey = GlobalKey<FormState>();
  static String _title = '';
  static String _description = '';
  static String _btnTextSave = 'Add Note';
  static String _titleText = 'New Note';
  static DateTime? _deadline = DateTime.now();
  static final TextEditingController _deadlineController =
      TextEditingController();
  static final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  static final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // ignore: non_constant_identifier_names
  // getter - setter
  static get formKey => _formKey;
  static String get title => _title;
  static String get description => _description;
  static String get btnTextSave => _btnTextSave;
  static String get titleText => _titleText;
  static DateTime? get deadline => _deadline;
  static TextEditingController get deadlineController => _deadlineController;
  static DateFormat get dateFormatter => _dateFormatter;
  static DatabaseHelper get databaseHelper => _databaseHelper;

  static set title(String value) => _title = value;
  static set description(String value) => _description = value;
  static set btnTextSave(String value) => _btnTextSave = value;
  static set titleText(String value) => _titleText = value;
  static set deadline(DateTime? value) => _deadline = value;

  static Future<int> updatedNote(Note note) async =>
      await _databaseHelper.updateNote(note);

  static Future<int> insertedNote(Note note) async =>
      await _databaseHelper.insertNote(note);

  static Future<int> deletedNote(int id) async =>
      await _databaseHelper.deleteNote(id);
}
