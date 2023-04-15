import 'package:flutter_16/model/note.dart';
import 'package:flutter_16/objectbox.g.dart';

class NotesRepository {
  late final Store _store;
  late final Box<Note> _box;

  List<Note> get notes => _box.getAll();

  Future initDB() async {
    _store = await openStore();
    _box = _store.box<Note>();
  }

  Future addNote(Note note) async {
    await _box.putAsync(note);
  }

  Future deleteNote(int id) async {
    _box.remove(id);
  }

  Future updateNote(int id, Note note) async {
    _box.remove(id);
    await _box.putAsync(note);
  }
}
