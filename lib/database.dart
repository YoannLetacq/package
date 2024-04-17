import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'notes.dart';

class DataManager {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'notes.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE notes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT
        )
      ''');
    });
  }

  //CRUD

  Future<List<Note>> getAllNotes() async {
    final db = await database;
    var res = await db.query("Notes");
    List<Note> list = res.isNotEmpty ? res.map((c) => Note.fromMap(c)).toList() : [];
    return list;
  }

  addNote(Note note) async {
    final db = await database;
    var res = await db.insert("Notes", note.toMap());
    return res;
  }

  deleteNote(int id) async {
    final db = await database;
    db.delete("Notes", where: "id = ?", whereArgs: [id]);
  }

  updateNote(Note note) async {
    final db = await database;
    await db.update("Notes", note.toMap(), where: "id = ?", whereArgs: [note.id]);
  }
}

