# Todo List - App (MVC, SQFlite)

### Version: 
> - Dart 2.17.0
> - Flutter version 2.10.0-1.0.pre.174 


## The following features:
  - View & Change: The status of the note: completed, incompleted.
  - Update, Insert, Delete Note.


## HOW TO RUN THE CODE: 
### Prepare: 
> #### Request setup IDE: [VSCode](https://code.visualstudio.com) or [Android Studio Code](https://developer.android.com/studio)
### 1.  Step 1 Clone my project from Github: https://github.com/NgocThach2000/Todolist-App.git
```sh
git clone https://github.com/NgocThach2000/Todolist-App.git
```
### 2.  Step 2 Setup environment variable 
```sh
flutter doctor -v
flutter pub get
```
### 3.  Step 3 Run project 
```sh
flutter run
```

## HOW TO RUN THE TEST: 
### After you finish the project install the [above](https://github.com/NgocThach2000/Todolist-App/edit/main/README.md#how-to-run-the-code) if you want to unit test then follow me

### My test files include:
- database_test.dart: includes checking logic of insert, update, delete, get notes after connecting to database after using model to mock database.
- note_model_test.dart: check the logic in the note, like id, title, description, deadline, status.

#### The test files are all automated functional tests.
#### To run test, you use command flutter run test/[test_file_name].dart. 
> Example: if you want to test the database_test.dart then follow code bellow:
```sh
flutter test test/model/database_test.dart
```

Notice: You must be start the emulator or real device to begin test.

### Demo - Android:
> <video src='https://user-images.githubusercontent.com/63405663/154407934-188b087e-3107-4711-8f97-9419ec4183cc.mp4' width=180/>

### Demo - IOS:
> <video src='https://user-images.githubusercontent.com/63405663/154418660-9ada37e6-a03d-47a3-a325-f22079146bab.mov' width=180/>


## Package: 
| Package | Link |
| ------ | ------ |
| sqflite: ^2.0.2 | https://pub.dev/packages/sqflite |
| intl 0.17.0 | https://pub.dev/packages/intl |
| path_provider: ^2.0.9 | https://pub.dev/packages/path_provider |
| mvc_pattern: ^8.7.0 | https://pub.dev/packages/mvc_pattern |
|   mockito: ^5.1.0 | https://pub.dev/packages/mockito |

# Document:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

