import 'package:tp_final/app/modules/note/data/provider/note_db_provider.dart';
import 'package:tp_final/app/modules/note/model/note_model.dart';

class NoteRepository {
  final dbProvider = NoteDbProvider();

  saveNote(Note note) async {
    await dbProvider.insert(note.toJson());
  }

  Future<List<Note>> retrieve() async {
    final List<Map<String, dynamic>> noteList = await dbProvider.query();
    List<Note> newHistoryList = noteList.map((e) => Note.fromJson(e)).toList();
    return newHistoryList;
  }

  deleteAllNote() async {
    retrieve().then((value) => value.map(
          (e) => dbProvider.delete(e.id!),
        ));
  }
}
