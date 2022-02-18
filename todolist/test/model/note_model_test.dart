import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/model/note_model.dart';

void main() {
  Note note = Note.withId(
      id: 0,
      title: 'Works',
      description: 'Write unit test now',
      deadline: DateTime.parse('2022-02-18 12:02:00'),
      status: 0);

  group('Verify Test Note', () {
    test('verify null note id', () {
      expect(note.id, equals(0));
    });

    test('verify note title', () {
      expect(note.title, equals('Works'));
    });

    test('verify note description', () {
      expect(note.description, equals('Write unit test now'));
    });
    test('verify note deadline', () {
      expect(note.deadline, equals(DateTime.parse('2022-02-18 12:02:00')));
    });
    test('verify note status', () {
      expect(note.status, equals(0));
    });
    test('verify note function toString', () {
      expect(
        note.toString(),
        equals(
            'Note{id: 0, title: Works, description: Write unit test now, deadline: 2022-02-18 12:02:00.000, status: 0}'),
      );
    });
  });
}
