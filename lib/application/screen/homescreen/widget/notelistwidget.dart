import 'package:flutter/material.dart';
import 'package:note_application/application/screen/homescreen/widget/note_list_layout.dart';
import 'package:note_application/domain/entity/note_entity.dart';

class NoteListWidget extends StatelessWidget {
  final List<NoteEntity> noteList;

  const NoteListWidget({
    Key? key,
    required this.noteList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(noteList.isEmpty){
      return const Center(child: Text("Add your first note"),);
    }else{
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          return NoteListLayout(note: noteList[index]);
        });
    }
  }
}
