import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_application/application/screen/addnotescreen/create_note_screen.dart';
import 'package:note_application/application/screen/homescreen/widget/note_list_layout.dart';
import 'package:note_application/application/screen/homescreen/widget/note_list_linear_layout.dart';
import 'package:note_application/domain/entity/note_entity.dart';

import '../bloc/bloc/home_bloc.dart';


enum NoteViewType {
  grid, linear
}

class NoteListWidget extends StatelessWidget {
  final List<NoteEntity> noteList;
  final NoteViewType typeLayout = NoteViewType.grid;
  final  Function(NoteEntity) onLongTap;

  const NoteListWidget({
    Key? key,
    required this.noteList,
    required this.onLongTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(noteList.isEmpty){
      return const Center(child: Text("Add your first note"),);
    }else{
      if(typeLayout == NoteViewType.linear){
        return NoteLinearLayoutWidget(noteList: noteList, onLongTap: onLongTap);
      }else{
        return NoteGridLayoutWidget(noteList: noteList, onLongTap: onLongTap,);
      }
    }
  }
}


class NoteLinearLayoutWidget extends StatelessWidget {

  final List<NoteEntity>  noteList;
  final Function(NoteEntity)  onLongTap;

  const NoteLinearLayoutWidget({super.key, required this.noteList, required this.onLongTap});

  @override
  Widget build(BuildContext context) {
    if(noteList.isEmpty){
      return const Center(child: Text("Add your first note"),);
    }else{
      return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          itemCount: noteList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () => onLongTap(noteList[index]),
                onTap: (){
                  //design request.
                  BlocProvider.of<HomeBloc>(context).add(RequestNavigateInEditModeToCreateNoteScreen(note: noteList[index]));
                },

                child: NoteListLinearLayout(note: noteList[index]));
          });
    }
  }
}


class NoteGridLayoutWidget extends StatelessWidget {

  final List<NoteEntity> noteList;

  final Function(NoteEntity) onLongTap;

  const NoteGridLayoutWidget({super.key, required this.noteList, required this.onLongTap});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: noteList.length,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 2, itemBuilder: (context, index){
      return InkWell(
          onLongPress: () => onLongTap(noteList[index]),
          onTap: (){
            //design request.
            BlocProvider.of<HomeBloc>(context).add(RequestNavigateInEditModeToCreateNoteScreen(note: noteList[index]));
          },

          child: NoteListLayout(note: noteList[index]));
    });
  }
}


