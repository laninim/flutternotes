import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:note_application/data/mock_note_list.dart';
import 'package:note_application/domain/note_entity.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState.initial()) {
    on<SaveNoteDataEvent>(saveNoteInTheDataSource);
  }

  FutureOr<void> saveNoteInTheDataSource(SaveNoteDataEvent event, Emitter<NoteState> emit) {
    debugPrint("Handle save note event");
    final newNote = event.noteBeSave;
    kMockNoteList.add(newNote);
  }
}
