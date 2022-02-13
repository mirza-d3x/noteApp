import 'package:flutter/material.dart';
import 'package:note_app_sample/screens/screen_add_notes.dart';
import 'package:note_app_sample/widget/note_item.dart';

class ScreenAllNotes extends StatelessWidget {
  const ScreenAllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'All Notes',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(20),
          children: List.generate(
            10,
            (index) => NoteItem(
                id: index.toString(),
                title: 'Lorem Ipsum Title $index',
                content:
                    'Lorem ipsum is a dummy notes iam flutter developerajjahjajhudjgndjvnjdnzfjaudfuuaurhafdknfjadndcnmndaflgharbhbfdckakjghegabfgjnejngka;'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((ctx) => ScreenAddNote(
                    type: ActionType.addNote,
                  )),
            ),
          );
        },
        label: const Text('new'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
