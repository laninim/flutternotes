import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note_model.dart';

class SqlLiteDatabaseSource {
  late Future<Database> database;

  Future<Database> openDatabaseConnection() async {
    return openDatabase(join(await getDatabasesPath(), 'note_database.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE notes (dbId INTEGER PRIMARY KEY AUTOINCREMENT, uuid VARCHAR, title TEXT, content TEXT, createAt TEXT);");
    }, version: 1);
  }

  void insertNote(NoteModel note) async {
    Database database = await openDatabaseConnection();
    int errorCode = await database.insert('notes', note.toMap());
    database.close();
    if (errorCode == 0) {
      print("Porcamdoo che cazzo è successo!");
    }
  }

  Future<List<NoteModel>> getNoteList() async {
    Database database = await openDatabaseConnection();
    final List<Map<String, dynamic>> noteMaps = await database.query("notes");
    database.close();
    return List.generate(noteMaps.length, (i) {
      return NoteModel(
          dbId: noteMaps[i]['dbId'],
          uuid: noteMaps[i]['uuid'],
          title: noteMaps[i]['title'],
          content: noteMaps[i]['content'],
          createAt: noteMaps[i]['createAt']);
    });

  }

  Future<void> deleteNote(NoteModel model) async {

    print("Inizio cancellazione");
    Database database = await openDatabaseConnection();
    int errorCode = await database.rawDelete("DELETE from notes WHERE uuid = '${model.uuid}'");
    print("Uuid da cancelllare: ${model.uuid} and affetct number ${errorCode} row ");
    database.close();


    }

  }

