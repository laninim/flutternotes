import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:note_application/data/mock_note_list.dart';
import 'package:note_application/data/repositories/note_repository_impl.dart';
import 'package:note_application/domain/entity/note_entity.dart';
import 'package:note_application/domain/usecase/add_note_usecase.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState.initial()) {
    on<SaveNoteDataEvent>(saveNoteInTheDataSource);
  }

  FutureOr<void> saveNoteInTheDataSource(SaveNoteDataEvent event, Emitter<NoteState> emit) {
    debugPrint("Handle save note event");
    final newNote = event.noteBeSave;
    final addNoteUseCase = AddNoteUseCase(repository: NoteRepositoryImpl());
    addNoteUseCase.addNoteToDatabase(event.noteBeSave);
  }
}
