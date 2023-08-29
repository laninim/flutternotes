import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/domain/note_entity.dart';

import 'notebloc/note_bloc.dart';

//create note show note edit note

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(),
      child: BlocConsumer<NoteBloc, NoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Create Note"),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                        onPressed: () {
                          BlocProvider.of<NoteBloc>(context).add(
                              SaveNoteDataEvent(
                                  noteBeSave: NoteEntity(
                                      noteTitle: "noteTitle",
                                      noteContent: "noteContent",
                                      createAt: DateTime.now())));
                          Navigator.of(context).pop(true);
                        },

                        icon: const Icon(Icons.save)))
              ],
            ),
            body: WillPopScope(
                onWillPop: () async {
                  return true;
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6),
                    child: TextFormField(
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      autofocus: true,
                      autocorrect: false,
                    ))),
          );
        },
      ),
    );
  }
}
