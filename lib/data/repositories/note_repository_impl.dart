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
  void deleteNote() {
    // TODO: implement deleteNote
  }

  @override
  Future<List<NoteModel>> getNoteList() {
    // TODO: implement getNoteList
    throw UnimplementedError();
  }

  @override
  void updateNote() {
    // TODO: implement updateNote
  }

}