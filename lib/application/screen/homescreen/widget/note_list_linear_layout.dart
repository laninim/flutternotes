import 'package:flutter/material.dart';

import '../../../../domain/entity/note_entity.dart';

class NoteListLinearLayout extends StatelessWidget {

  final NoteEntity note;

  const NoteListLinearLayout({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.note),
        title: Text(note.noteTitle),
        subtitle: Text(note.createAt.toString()),

      ),
    );
  }
}
