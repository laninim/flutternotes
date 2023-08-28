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
    BlocProvider.of<HomeBloc>(context).add(FetchNoteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context); //Accede al tema dell'applicazione.

    var isLoading = true;

    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeScreenAction,
      listener: (context, state) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CreateNoteScreen()));
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Notes"),
            centerTitle: Platform.isAndroid ? false : true,
            backgroundColor: themeData.colorScheme.primaryContainer,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(AddNoteFabButtonPressed());
            },
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder(
              buildWhen: (previous, current) => current is HomeStateUI,
              bloc: BlocProvider.of<HomeBloc>(context),
              builder: (context, state) {
                final homePageState = state as HomeStateUI;
                if (homePageState.loading) {
                  return const LoadingContentWidget();
                } else if (homePageState.errorMessage != '') {
                  return ShowErrorAppWidget(
                      errorMessage: homePageState.errorMessage);
                } else {
                  isLoading = false;
                  return NoteListWidget(noteList: state.noteList);
                }
              })),
    );
  }
}
