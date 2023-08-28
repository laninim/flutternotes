part of 'home_bloc.dart';

sealed  class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


class FetchNoteEvent extends HomeEvent {

}

class CreateNewNoteEvent extends HomeEvent {
  final NoteEntity noteToBeAdded; 

  const CreateNewNoteEvent({required this.noteToBeAdded});
}
