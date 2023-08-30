import 'package:flutter/material.dart';
import 'package:note_application/domain/entity/note_entity.dart';

class NoteListLayout extends StatelessWidget {

  final NoteEntity note;

  const NoteListLayout({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
         children: [
           const SizedBox(height: 20,),
           Text(note.noteContent),
           const SizedBox(height: 20,),
           Text(note.createAt.toString())
         ],

        ),
      ),
    );
  }
}
