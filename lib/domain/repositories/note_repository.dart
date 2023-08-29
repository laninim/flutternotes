import '../../data/model/note_model.dart';

abstract class NoteRepository {

    void addNoteToDatabase (NoteModel note); 

    void updateNote () ;

    void deleteNote () ;

    Future<List<NoteModel>> getNoteList () ;
}