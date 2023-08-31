import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../data/model/note_model.dart';

// ignore: prefer_const_constructors
final kUuid = Uuid();

class NoteEntity extends Equatable {
  final String noteId;
  final String noteTitle;
  final String noteContent;
  final DateTime createAt;

  NoteEntity({required this.noteId, required this.noteTitle, required this.noteContent, required this.createAt});

  NoteEntity.FirstCreate(
      {required this.noteTitle,
      required this.noteContent,
      required this.createAt})
      : noteId = kUuid.v4();



  @override
  List<Object?> get props => [noteId];

  NoteEntity copyWith({
    int? noteId,
    String? noteTitle,
    String? noteContent,
    DateTime? createAt,
  }) {
    return NoteEntity(
      noteTitle: noteTitle ?? this.noteTitle,
      noteContent: noteContent ?? this.noteContent,
      createAt: createAt ?? this.createAt, noteId: '',
    );
  }

  @override
  String toString() {
    return 'NoteEntity(noteId: $noteId, noteTitle: $noteTitle, noteContent: $noteContent, createAt: $createAt)';
  }
}
