import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_application/data/repositories/note_repository_impl.dart';
import 'package:note_application/domain/entity/note_entity.dart';
import 'package:note_application/domain/usecase/delete_note_usecase.dart';
import 'package:note_application/domain/usecase/get_note_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeScreenState> {
  HomeBloc() : super(HomeState()) {
      on<RequestNavigateToCreateNoteScreen>(navigateToAnotherPage);
      on<StartApplicationEvent>(setupStartApplication);
      on<FetchNoteEvent>(fetchNotesFromDatabase);
      on<RemoveNoteEvent>(removeNoteFromDatabase);
      on<RequestNavigateInEditModeToCreateNoteScreen>(goToEditNoteScreen);
  }

  FutureOr<void> fetchNotesFromDatabase(FetchNoteEvent event, Emitter<HomeScreenState> emit) async {
    final getNoteUseCase = GetNoteUseCase();
    final myList = await getNoteUseCase.getNoteList();
    emit(NoteListState(noteList: [...myList]));
  }



  FutureOr<void> navigateToAnotherPage(RequestNavigateToCreateNoteScreen event, Emitter<HomeScreenState> emit) {
    debugPrint("User Send request for navigate to another screen");
    final currentState  = ResponseFabButtonState();
    emit(currentState);
  }

  FutureOr<void> setupStartApplication(StartApplicationEvent event, Emitter<HomeScreenState> emit) async {
    emit(LoadingState());
    final getNoteUseCase = GetNoteUseCase();
    final myList = await getNoteUseCase.getNoteList();
    emit(NoteListState(noteList: [...myList]));
  }

  FutureOr<void> removeNoteFromDatabase(RemoveNoteEvent event, Emitter<HomeScreenState> emit) async {
    print("incoming delete event want delete ${event.noteToBeDeleted.noteContent}");
    final deleteNoteUseCase = DeleteNoteUseCase(repository: NoteRepositoryImpl());
    deleteNoteUseCase.deleteNoteFromDatabase(event.noteToBeDeleted);
    final getNoteUseCase = GetNoteUseCase();
    final myList = await getNoteUseCase.getNoteList();
    emit(NoteListState(noteList: [...myList]));
  }

  FutureOr<void> goToEditNoteScreen(RequestNavigateInEditModeToCreateNoteScreen event, Emitter<HomeScreenState> emit) {
      final noteShow = event.note;
      final currentState = GoToEditNoteScreen(note: noteShow);
      emit(currentState);
  }
}
