part of 'home_bloc.dart';

abstract class HomeScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class HomeScreenAction extends HomeScreenState {
  HomeScreenAction();
}


 class HomeState extends HomeScreenState {
  HomeState() ;
}

//This state is emit when user ask for noteList.
class NoteListState extends HomeState {

  final List<NoteEntity> noteList;

  NoteListState({required this.noteList});

  @override
  // TODO: implement props
  List<Object?> get props => [noteList];



  NoteListState copyWith({
    List<NoteEntity>? noteList,
  }) {
    return NoteListState(
      noteList: noteList ?? this.noteList,
    );
  }
}

//this class is emit when screen loading some data.
class LoadingState extends HomeState {

}


//tell Ui there are problems and show Message.
class ErrorScreenState extends HomeState {
  final String messageError;

   ErrorScreenState({
    required this.messageError,
  });
}


//state for action inside the ui!
//emit when user press fab button and say to UI to navigate to another page!
class ResponseFabButtonState extends HomeScreenAction {
    final  clickAtTime = DateTime.now().millisecondsSinceEpoch;

    @override
  // TODO: implement props
  List<Object?> get props => [clickAtTime];
}







