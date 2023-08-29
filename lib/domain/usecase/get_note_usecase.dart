import 'package:note_application/data/repositories/note_repository_impl.dart';
import 'package:note_application/domain/entity/note_entity.dart';

class GetNoteUseCase {

    Future<List<NoteEntity>> getNoteList() async {
       final repository = NoteRepositoryImpl();
       final noteList = await repository.getNoteList();
       if(noteList.isNotEmpty){
         final  noteEntity = noteList.map((e) => NoteEntity(noteTitle: e.title, noteContent: e.content, createAt: DateTime.parse(e.createAt))).toList();
         return noteEntity;
       }
       return [];
    }
}