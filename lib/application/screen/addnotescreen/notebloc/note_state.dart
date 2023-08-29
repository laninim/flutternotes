part of 'note_bloc.dart';

@immutable
class NoteState {

  final String noteContent;
  final String noteTitle;



  const  NoteState(this.noteTitle, {required this.noteContent});

  factory NoteState.initial(){
    return const NoteState(
      "",
      noteContent : "" ,
    );
  }
}




