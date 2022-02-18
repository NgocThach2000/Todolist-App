import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/src/model/note_model.dart';
import 'note_model_test.mocks.dart';

@GenerateMocks([Note])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Note mockNote;

  setUp(() {
    mockNote = MockNote();
    mockNote = note;
  });

  group('Verify Test Note', () {
    test('verify null note id', () {
      expect(mockNote.id, equals(0));
    });

    test('verify note title', () {
      expect(mockNote.title, equals('Works'));
    });

    test('verify note description', () {
      expect(mockNote.description, equals('Write unit test now'));
    });
    test('verify note deadline', () {
      expect(mockNote.deadline, equals(DateTime.parse('2022-02-18 12:02:00')));
    });
    test('verify note status', () {
      expect(mockNote.status, equals(0));
    });
    test('verify note function toString', () {
      expect(
        mockNote.toString(),
        equals(
            'Note{id: 0, title: Works, description: Write unit test now, deadline: 2022-02-18 12:02:00.000, status: 0}'),
      );
    });
  });
}

final note = Note.withId(
  id: 0,
  title: 'Works',
  description: 'Write unit test now',
  deadline: DateTime.parse('2022-02-18 12:02:00'),
  status: 0,
);
