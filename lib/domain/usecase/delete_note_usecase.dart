import 'package:note_application/data/model/note_model.dart';
import 'package:note_application/data/repositories/note_repository_impl.dart';
import 'package:note_application/domain/entity/note_entity.dart';

class DeleteNoteUseCase {

      final NoteRepositoryImpl repository;

     const DeleteNoteUseCase({required this.repository});

     void deleteNoteFromDatabase(NoteEntity entity){
        final noteModel = NoteModel(dbId: 0, uuid: entity.noteId, title: entity.noteTitle, content: entity.noteContent, createAt: entity.createAt.toString());
        repository.deleteNote(noteModel);
     }
}