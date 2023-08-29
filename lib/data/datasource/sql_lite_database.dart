import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note_model.dart';

class SqlLiteDatabaseSource {

  late Future<Database> database;

     Future<Database> openDatabaseConnection () async {

       return  openDatabase(
          join(await getDatabasesPath(), 'note_database.db'),
         onCreate: (db, version) {
            return db.execute("CREATE TABLE notes (dbId INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT, title TEXT, content TEXT, createAt TEXT);");
         },
         version: 1
       );

     }

     void insertNote(NoteModel note) async {
       Database database = await openDatabaseConnection();
       int errorCode = await database.insert('notes', note.toMap());

       if(errorCode == 0){
         print("Porcamdoo che cazzo è successo!");
       }



     }
}