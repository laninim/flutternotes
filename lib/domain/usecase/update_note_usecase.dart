import 'package:note_application/data/model/note_model.dart';
import 'package:note_application/data/repositories/note_repository_impl.dart';
import 'package:note_application/domain/entity/note_entity.dart';

class UpdateNoteUseCase {

    void updateNote(NoteEntity model) {
      final repository = NoteRepositoryImpl();
      NoteModel noteModel = NoteModel(dbId: 0, uuid: model.noteId, title: model.noteTitle, content: model.noteContent, createAt: model.createAt.toString());
      repository.updateNote(noteModel);
    }
}