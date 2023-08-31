import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/application/screen/homescreen/bloc/bloc/home_bloc.dart';
import 'package:note_application/domain/entity/note_entity.dart';

import '../homescreen/home_screen.dart';
import 'notebloc/note_bloc.dart';

//create note show note edit note

//enum
enum NoteScreenMode{
  edit,create
}

class CreateNoteScreen extends StatelessWidget {

  //note to be displayed
  final NoteEntity? noteDisplayed;

  final NoteScreenMode screenMode;

  CreateNoteScreen({super.key, required this.noteDisplayed, required this.screenMode});

  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    contentController.text = noteDisplayed?.noteContent ?? "";

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
                          if(screenMode == NoteScreenMode.create){
                            final content = contentController.text;
                            var title = "";

                            if(content.length < 10) {
                              title = DateTime.now().millisecond.toString();
                            }else{
                              title = content.substring(0, 9);
                            }
                            BlocProvider.of<NoteBloc>(context).add(

                                SaveNoteDataEvent(
                                    noteBeSave: NoteEntity.FirstCreate(
                                        noteTitle: title,
                                        noteContent: content,
                                        createAt: DateTime.now())));
                            Navigator.of(context).pop(true);

                          }else {
                            final content = contentController.text;

                            BlocProvider.of<NoteBloc>(context).add(
                             UpdateNoteDataEvent(noteBeUpdate: NoteEntity(noteId: noteDisplayed!.noteId, noteTitle: noteDisplayed!.noteTitle, noteContent: content, createAt: noteDisplayed!.createAt))
                            );

                            Navigator.of(context).pop(true);


                          }
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

                      controller: contentController,
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
