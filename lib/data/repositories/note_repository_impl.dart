import 'package:flutter/cupertino.dart';
import 'package:note_application/data/datasource/sql_lite_database.dart';
import 'package:note_application/data/model/note_model.dart';

import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {

  @override
  void addNoteToDatabase(NoteModel note) {
    final sqfliteDb = SqlLiteDatabaseSource();
    sqfliteDb.insertNote(note);
  }

  @override
  void deleteNote(NoteModel model) async {
    final sqfliteDb = SqlLiteDatabaseSource();
     await sqfliteDb.deleteNote(model);



  }

  @override
  Future<List<NoteModel>> getNoteList() async {
    final sqfliteDb = SqlLiteDatabaseSource();
    final List<NoteModel> noteList = await sqfliteDb.getNoteList();
    return noteList;
  }

  @override
  void updateNote() {
    // TODO: implement updateNote
  }



}