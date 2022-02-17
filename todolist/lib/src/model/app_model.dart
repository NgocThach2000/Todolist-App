import 'package:flutter/cupertino.dart';
import 'package:todolist/src/view/home_view.dart';
import 'package:todolist/src/view/complete_note_view.dart';
import 'package:todolist/src/view/incomplete_note_view.dart';

class AppModel {
  // ignore: prefer_final_fields
  static int _selectedIndex = 0;
  static final List<Widget> _screens = [
    const HomeView(),
    const CompleteNoteView(),
    const IncompleteNoteView(),
  ];

  //getter - setter
  // ignore: unnecessary_getters_setters
  static int get selectedIndex => _selectedIndex;
  // ignore: await_only_futures
  static List<Widget> get screens => _screens;

  static set selectedIndex(int value) => _selectedIndex = value;
}
