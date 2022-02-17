import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:todolist/src/model/app_model.dart';

class AppController extends ControllerMVC {
  factory AppController([StateMVC? state]) => _this ??= AppController._(state);
  AppController._(StateMVC? state) : super(state);

  static AppController? _this;

  int get selectedIndex => AppModel.selectedIndex;
  List<Widget> get screens => AppModel.screens;

  set selectedIndex(int value) => AppModel.selectedIndex = value;
}
