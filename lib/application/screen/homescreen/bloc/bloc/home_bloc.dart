import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_application/data/mock_note_list.dart';
import 'package:note_application/domain/entity/note_entity.dart';
import 'package:note_application/domain/usecase/get_note_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeScreenState> {
  HomeBloc() : super(HomeState()) {
      on<RequestNavigateToCreateNoteScreen>(navigateToAnotherPage);
      on<StartApplicationEvent>(setupStartApplication);
      on<FetchNoteEvent>(fetchNotesFromDatabase);
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
    await Future.delayed(const Duration(seconds: 3));
    emit(NoteListState(noteList: [...kMockNoteList]));
  }
}
