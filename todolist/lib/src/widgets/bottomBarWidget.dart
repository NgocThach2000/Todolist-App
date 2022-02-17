// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class widgetBottomBar extends StatelessWidget {
  final int? selectedIndex;
  final Function(int) onTap;
  // ignore: prefer_const_constructors_in_immutables
  widgetBottomBar({Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex!,
      onTap: onTap,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black45,
      iconSize: 28,
      selectedFontSize: 18,
      unselectedFontSize: 13,
      backgroundColor: Colors.orange,
      mouseCursor: SystemMouseCursors.grab,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_add_check),
          label: 'Completed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.incomplete_circle),
          label: 'Incompleted',
        ),
      ],
    );
  }
}
