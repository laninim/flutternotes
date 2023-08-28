part of 'home_bloc.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];

}

class HomeStateUI extends HomeState {

  final bool loading; 
  final String errorMessage; 
  final List<NoteEntity> noteList; 
  
    HomeStateUI({required this.loading, required this.errorMessage, required this.noteList});

   factory HomeStateUI.initial(){
    return  HomeStateUI(
      loading: true, 
      errorMessage: "", 
      noteList: const []
    );
   }
  
  @override
  List<Object> get props => [loading, errorMessage, noteList];

  HomeStateUI copyWith({
    bool? loading,
    String? errorMessage,
    List<NoteEntity>? noteList,
  }) {
    return HomeStateUI(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      noteList: noteList ?? this.noteList,
    );
  }

  @override
  String toString() => 'HomeState(loading: $loading, errorMessage: $errorMessage, noteList: $noteList)';
}

//! Set action for the HomeScreenUI

abstract class HomeScreenAction extends HomeState {
  final clickTime = DateTime.now().millisecondsSinceEpoch;
  
  @override
  List<Object> get props => [clickTime] ; 
}

class GoToCreateNotePage extends HomeScreenAction {
  
}




