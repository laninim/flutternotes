import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_application/domain/note_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeScreenState> {
  HomeBloc() : super(HomeState()) {
      on<RequestNavigateToCreateNoteScreen>(navigateToAnotherPage);
      on<StartApplicationEvent>(setupStartApplication);
  }

  FutureOr<void> fetchNotesFromDatabase(FetchNoteEvent event, Emitter<HomeState> emit) async {

  }



  FutureOr<void> navigateToAnotherPage(RequestNavigateToCreateNoteScreen event, Emitter<HomeScreenState> emit) {
    debugPrint("User Send request for navigate to another screen");
    final currentState  = ResponseFabButtonState();
    emit(currentState);
  }

  FutureOr<void> setupStartApplication(StartApplicationEvent event, Emitter<HomeScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(NoteListState(noteList: [
      NoteEntity(noteTitle: "MyNote", noteContent: "Mycontent", createAt: DateTime.now())
    ]));
  }
}
