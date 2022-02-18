import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/database/database.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todolist/src/model/note_model.dart';
import 'database_test.mocks.dart';

@GenerateMocks([DatabaseHelper])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockDatabase dBMockDatabase;
  setUp(() {
    dBMockDatabase = MockDatabase();
  });
  group('Database testing logic', () {
    test('verify when getting note list to database', () async {
      when(dBMockDatabase.getNoteList()).thenAnswer((_) async => [mockNote]);
      final noteList = await dBMockDatabase.getNoteList();
      expect(noteList.length, 1);
      expect(noteList[0].title, 'Works');
    });
    test('verify when getting map note list to database', () async {
      List<Map<String, dynamic>> mapNoteList = [
        mockNote.toMap(),
        mockNote1.toMap()
      ];
      when(dBMockDatabase.getNoteMapList())
          .thenAnswer((_) async => [mapNoteList.first, mapNoteList.last]);
      final noteMapList = await dBMockDatabase.getNoteMapList();
      expect(noteMapList.length, 2);
    });
    test('verify when inserting note to database', () async {
      when(dBMockDatabase.insertNote(any)).thenAnswer((_) async => 1);
      dBMockDatabase.insertNote(mockNote);
      verify(dBMockDatabase.insertNote(mockNote)).called(1);
    });
    test('verify when updating note to database', () async {
      when(dBMockDatabase.updateNote(any)).thenAnswer((_) async => 1);
      dBMockDatabase.updateNote(mockNote);
      verify(dBMockDatabase.updateNote(mockNote)).called(1);
    });
    test('verify when deleting note to database', () async {
      when(dBMockDatabase.deleteNote(0)).thenAnswer((_) async => 1);
      dBMockDatabase.deleteNote(0);
      verify(dBMockDatabase.deleteNote(0)).called(1);
    });
  });
}

final mockNote = Note.withId(
  id: 0,
  title: 'Works',
  description: 'Write unit test now',
  deadline: DateTime.parse('2022-02-18 12:02:00'),
  status: 0,
);

final mockNote1 = Note.withId(
  id: 0,
  title: 'Pinic',
  description: 'Picnic with my friend',
  deadline: DateTime.parse('2022-02-19 07:02:00'),
  status: 1,
);
