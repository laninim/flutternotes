import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/application/core/widgets/errors_widget.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Notes"),
        centerTitle: Platform.isAndroid ? false : true,
        backgroundColor: themeData.colorScheme.primaryContainer,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded))
        ],
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state){
        final homePageState = state as HomeState; 
        if(homePageState.loading){
          return const LoadingContentWidget();
        }
        else if(homePageState.errorMessage != ''){
          return  ShowErrorAppWidget(errorMessage: homePageState.errorMessage);
        }else{
          return NoteListWidget(noteList: []);
        }
      })
    );
  }
}