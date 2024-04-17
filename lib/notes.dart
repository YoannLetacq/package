class Note {
  int id;
  String title;
  String body;
  DateTime date;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'date': date.toIso8601String(),  // Convertit DateTime en String ISO-8601
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      date: DateTime.parse(map['date']),  // Convertit une String ISO-8601 en DateTime
    );
  }
}
