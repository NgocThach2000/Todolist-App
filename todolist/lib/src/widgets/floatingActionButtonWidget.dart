// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class widgetFloatingActionButton extends StatelessWidget {
  final String? heroTag;
  final VoidCallback? onPressed;
  const widgetFloatingActionButton(
      {Key? key, this.heroTag, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      child: const Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: onPressed,
    );
  }
}
