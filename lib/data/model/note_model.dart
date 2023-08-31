class NoteModel {
   final int dbId;
   String? uuid;
   final String title;
   final String content;
   final String createAt;

   NoteModel({
     required this.dbId,
     required this.uuid,
     required this.title,
     required this.content,
     required this.createAt

});

   Map<String, dynamic> toMap() {
    return {

      'uuid': this.uuid,
      'title': this.title,
      'content': this.content,
      'createAt': this.createAt,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      dbId: map['dbId'] as int,
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createAt: map['createAt'] as String,
    );
  }
}