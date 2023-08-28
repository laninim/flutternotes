import 'dart:io';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    );
  }
}