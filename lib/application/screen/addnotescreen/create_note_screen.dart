import 'package:flutter/material.dart';

//create note show note edit note

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.save),
        )
      ],
      ),
        body: WillPopScope(
          onWillPop: () async {
            return true; 
          },
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                  Expanded(child: ListView(
                    children: [
                      TextFormField(
                      minLines: 3,
                        maxLines: 50,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: InputBorder.none
                        ),
                        autofocus: true,
                        autocorrect: false,
                  )

                    ],
                  ))

              ],
            ),
          ),
        )
    );
  }
}