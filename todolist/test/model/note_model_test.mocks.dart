import 'dart:async' as _dasyc;

import 'package:mockito/mockito.dart' as _mockito;
import 'package:todolist/src/model/note_model.dart' as _note;

class _FakeNote extends _mockito.Fake implements _note.Note {}

/// A class which mocks [Note].
///
/// See the documentation for Mockito's code generation for more information.
class MockNote extends _mockito.Mock implements _note.Note {
  MockNote() {
    _mockito.throwOnMissingStub(this);
  }

  @override
  int get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: null) as int);
  @override
  String get title =>
      (super.noSuchMethod(Invocation.getter(#title), returnValue: '')
          as String);
  @override
  String get description =>
      (super.noSuchMethod(Invocation.getter(#description), returnValue: '')
          as String);
  @override
  DateTime get deadline =>
      (super.noSuchMethod(Invocation.getter(#deadline), returnValue: '')
          as DateTime);
  int get status =>
      (super.noSuchMethod(Invocation.getter(#status), returnValue: null)
          as int);
  @override
  Map<String, dynamic> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);

  @override
  String toString() => super.toString();
}
