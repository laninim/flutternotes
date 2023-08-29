import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/application/core/services/themedata.dart';
import 'package:note_application/application/screen/addnotescreen/notebloc/note_bloc.dart';
import 'package:note_application/application/screen/homescreen/bloc/bloc/home_bloc.dart';
import 'package:note_application/application/screen/homescreen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        title: 'Flutter AppNote',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(create: (context) => HomeBloc(),

          child: const HomeScreen(),
        ));
  }
}
