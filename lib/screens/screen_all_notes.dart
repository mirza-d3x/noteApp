import 'package:flutter/material.dart';

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
        children: [
          // List.generate(10, (index) => NoteItem)
        ],
      )),
    );
  }
}

