// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class widgetPadding extends StatelessWidget {
  final String? centerTitle;
  final String? elementNoteLength;
  final String? allNoteLength;
  const widgetPadding({
    required this.centerTitle,
    this.elementNoteLength,
    this.allNoteLength,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              (elementNoteLength == null)
                  ? '${centerTitle!} (${allNoteLength!} Note)'
                  : centerTitle!,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          (elementNoteLength != null)
              ? Center(
                  child: Text(
                    '(${elementNoteLength!}/${allNoteLength!})',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox(
                  height: 10,
                ),
        ],
      ),
    );
  }
}
