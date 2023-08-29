import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/application/core/widgets/errors_widget.dart';
import 'package:note_application/application/screen/addnotescreen/create_note_screen.dart';
import 'package:note_application/application/screen/homescreen/bloc/bloc/home_bloc.dart';
import 'package:note_application/application/screen/homescreen/widget/loadingpage.dart';
import 'package:note_application/application/screen/homescreen/widget/notelistwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(StartApplicationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context); //Accede al tema dell'applicazione.

    var isLoading = true;

    return BlocConsumer(
        buildWhen: (previous, current) => current is! HomeScreenAction,
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if(state is LoadingState){
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Flutter Notes"),
                  centerTitle: Platform.isAndroid ? false : true,
                  backgroundColor: themeData.colorScheme.primaryContainer,
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded))
                  ],
                ),
                floatingActionButton: Visibility(
                  visible: false,
                  child: FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(RequestNavigateToCreateNoteScreen());
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                body: const LoadingContentWidget(),
            );
          }else if(state is NoteListState){
             return Scaffold(
              appBar: AppBar(
                title: const Text("Flutter Notes"),
                centerTitle: Platform.isAndroid ? false : true,
                backgroundColor: themeData.colorScheme.primaryContainer,
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded))
                ],
              ),
              floatingActionButton: Visibility(
                child: FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(RequestNavigateToCreateNoteScreen());
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              body: NoteListWidget(noteList: state.noteList,),
            );
          }else if(state is ErrorScreenState){
            return Scaffold(
              appBar: AppBar(
                title: const Text("Flutter Notes"),
                centerTitle: Platform.isAndroid ? false : true,
                backgroundColor: themeData.colorScheme.primaryContainer,
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded))
                ],
              ),
              floatingActionButton: Visibility(
                child: FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(RequestNavigateToCreateNoteScreen());
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              body: ShowErrorAppWidget(errorMessage: state.messageError,),
            );
          }
          return const Text("Errore critico gestione stato");
        },
        listener: (BuildContext context, Object? state) {
          if(state is ResponseFabButtonState){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateNoteScreen()));
          }
        },
        listenWhen: (previous, current)  => current is HomeScreenAction,
      );

  }
}
