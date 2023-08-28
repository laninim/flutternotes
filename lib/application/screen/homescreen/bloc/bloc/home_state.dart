part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool loading; 
  final String errorMessage; 
  final List<String> noteList; 
  
   const HomeState({required this.loading, required this.errorMessage, required this.noteList});

   factory HomeState.initial(){
    return const HomeState(
      loading: true, 
      errorMessage: "", 
      noteList: []
    );
   }
  
  @override
  List<Object> get props => [loading, errorMessage, noteList];

  HomeState copyWith({
    bool? loading,
    String? errorMessage,
    List<String>? noteList,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      noteList: noteList ?? this.noteList,
    );
  }

  @override
  String toString() => 'HomeState(loading: $loading, errorMessage: $errorMessage, noteList: $noteList)';
}




