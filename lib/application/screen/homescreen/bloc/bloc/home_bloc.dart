import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_application/domain/note_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateUI.initial()) {
    on<FetchNoteEvent>(fetchNotesFromDatabase);
    on<CreateNewNoteEvent>(createNewNote);
    on<AddNoteFabButtonPressed>(navigateToCreateNotePage);
  }

  FutureOr<void> fetchNotesFromDatabase(FetchNoteEvent event, Emitter<HomeState> emit) async {
      emit((state as HomeStateUI).copyWith(loading: true));
      await Future.delayed(const Duration(seconds: 3));

      //emit state with notelist
      emit((state as HomeStateUI).copyWith(noteList: [...(state as HomeStateUI).noteList], loading: false));
           

  }

  FutureOr<void> createNewNote(CreateNewNoteEvent event, Emitter<HomeState> emit) {
    emit((state as HomeStateUI).copyWith(noteList: [...(state as HomeStateUI).noteList, event.noteToBeAdded]));
  }

  FutureOr<void> navigateToCreateNotePage(AddNoteFabButtonPressed event, Emitter<HomeState> emit) {
    final navigationState = GoToCreateNotePage(); 
    emit(navigationState);
  }
}
