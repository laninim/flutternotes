import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_application/domain/note_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<FetchNoteEvent>(fetchNotesFromDatabase);
    on<CreateNewNoteEvent>(createNewNote);
  }

  FutureOr<void> fetchNotesFromDatabase(FetchNoteEvent event, Emitter<HomeState> emit) async {
      emit(state.copyWith(loading: true));
      await Future.delayed(const Duration(seconds: 3));

      //emit state with notelist
      emit(state.copyWith(noteList: [...state.noteList], loading: false));
           

  }

  FutureOr<void> createNewNote(CreateNewNoteEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(noteList: [...state.noteList, event.noteToBeAdded]));
  }
}
