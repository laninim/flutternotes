import 'package:flutter/material.dart';
import 'package:note_application/domain/entity/note_entity.dart';

class NoteListLayout extends StatelessWidget {

  final NoteEntity note;

  const NoteListLayout({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: ListTile(
        leading: const Icon(Icons.note),
        title: Text(note.noteTitle),
        subtitle: Text(note.noteContent),
        trailing: Text(note.createAt.toString()),
      ),
    );
  }
}
