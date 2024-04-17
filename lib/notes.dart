class Note {
  int id;
  String title;
  String body;

  Note({
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}