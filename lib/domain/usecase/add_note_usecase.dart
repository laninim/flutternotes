import 'package:note_application/data/model/note_model.dart';
import 'package:note_application/data/repositories/note_repository_impl.dart';
import 'package:note_application/domain/entity/note_entity.dart';

class AddNoteUseCase {

     final NoteRepositoryImpl repository;

     const AddNoteUseCase ({required this.repository});

     void addNoteToDatabase(NoteEntity notes) {
        final noteModel = NoteModel(dbId: 0, uuid: notes.noteId, title: notes.noteTitle, content: notes.noteContent, createAt: notes.createAt.toString());
        repository.addNoteToDatabase(noteModel);
     }
}