// ignore_for_file: unnecessary_null_comparison
import 'dart:async' as _dasyc;

import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/database/database.dart' as _todoDatabase;
import 'package:mockito/mockito.dart' as _mockito;
import 'package:sqflite/sqflite.dart' as _sqflite;
import 'package:todolist/src/model/note_model.dart' as _note;

class _FakeDatabase extends _mockito.Fake implements _sqflite.Database {}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _mockito.Mock
    implements _todoDatabase.DatabaseHelper {
  MockDatabase() {
    _mockito.throwOnMissingStub(this);
  }

  @override
  _sqflite.Database get db => (super.noSuchMethod(Invocation.getter(#database),
      returnValue: _FakeDatabase()) as _sqflite.Database);

  @override
  set db(_sqflite.Database? _db) =>
      super.noSuchMethod(Invocation.setter(#database, _db),
          returnValueForMissingStub: null);

  @override
  _dasyc.Future<int> insertNote(_note.Note? toAddNote) =>
      (super.noSuchMethod(Invocation.method(#insertNote, [toAddNote]),
          returnValue: Future<int>.value(0)) as _dasyc.Future<int>);

  @override
  _dasyc.Future<int> updateNote(_note.Note? toUpdatedNote) =>
      (super.noSuchMethod(Invocation.method(#updateNote, [toUpdatedNote]),
          returnValue: Future<int>.value(0)) as _dasyc.Future<int>);

  @override
  _dasyc.Future<int> deleteNote(int id) =>
      (super.noSuchMethod(Invocation.method(#deleteNote, [id]),
          returnValue: Future<int>.value(0)) as _dasyc.Future<int>);

  @override
  _dasyc.Future<List<_note.Note>> getNoteList() =>
      (super.noSuchMethod(Invocation.method(#getNoteList, []),
              returnValue: Future<List<_note.Note>>.value(<_note.Note>[]))
          as _dasyc.Future<List<_note.Note>>);

  @override
  _dasyc.Future<List<Map<String, dynamic>>> getNoteMapList() =>
      (super.noSuchMethod(Invocation.method(#getNoteMapList, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _dasyc.Future<List<Map<String, dynamic>>>);

  @override
  String toString() => super.toString();
}
