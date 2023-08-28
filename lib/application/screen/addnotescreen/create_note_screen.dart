import 'package:flutter/material.dart';

//create note show note edit note

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Note1"),
      actions: const [
        Icon(Icons.save)
      ],
      ),
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