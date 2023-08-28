import 'package:flutter/material.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            return true; 
          },
          child: const Column(

          ),
        )
    );
  }
}