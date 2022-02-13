import 'dart:html';

import 'package:flutter/material.dart';

enum ActionType {
  addNote,
  editNote,
}

class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  final String id;
  const ScreenAddNote({
    Key? key,
    required this.type,
    required this.id,
  }) : super(key: key);

  @override
  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              // Add Note
              break;
            case ActionType.editNote:
              // Edit Note
              break;
          }
        },
        icon: const Icon(
          Icons.save,
        ),
        label: const Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
