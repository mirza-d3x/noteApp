import 'package:flutter/material.dart';
import 'package:note_app_sample/data/data.dart';
import 'package:note_app_sample/data/note_model/note_model.dart';

enum ActionType {
  addNote,
  editNote,
}

class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  String? id;
  ScreenAddNote({
    Key? key,
    required this.type,
    this.id,
  }) : super(key: key);

  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              // Add Note
              saveNote();
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

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          type.name.toUpperCase(),
        ),
        actions: [saveButton],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _contentController,
              maxLength: 100,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;

    final _newNote = NoteModel.create(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );

    final newNote = await NoteDB().createNote(_newNote);
    if (newNote != null) {
      print('Note saved');
      // Navigator.of(context).pop();
    } else {
      print('Error while saving data');
    }
  }
}
