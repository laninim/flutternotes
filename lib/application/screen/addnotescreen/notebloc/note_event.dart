part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

class SaveNoteDataEvent extends NoteEvent {
   final NoteEntity noteBeSave;

    SaveNoteDataEvent({required this.noteBeSave});
}

class UpdateNoteDataEvent extends NoteEvent {
  final NoteEntity noteBeUpdate;

  UpdateNoteDataEvent({required this.noteBeUpdate});
}
