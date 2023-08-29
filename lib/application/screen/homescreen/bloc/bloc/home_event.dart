part of 'home_bloc.dart';

sealed  class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


class FetchNoteEvent extends HomeEvent {}


//Fire when user want save a New Note in dataSources.
class CreateNewNoteEvent extends HomeEvent {
  final NoteEntity noteToBeAdded; 

  const CreateNewNoteEvent({required this.noteToBeAdded});
}

//fire when Ui ask for an update note.
class RequestUpadateNoteListData extends HomeEvent {

}


//fire this event when user click on fab button for go to CreateNoteScreen.
class RequestNavigateToCreateNoteScreen extends HomeEvent {}

class StartApplicationEvent extends HomeEvent {}
