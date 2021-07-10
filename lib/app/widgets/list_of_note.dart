import 'package:flutter/material.dart';
import 'package:tp_final/app/modules/note/model/note_model.dart';
import 'package:tp_final/app/widgets/note_adapter.dart';

class ListOfNotes extends StatelessWidget {
  const ListOfNotes({required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: notes.map((note) => NoteAdapter(note: note)).toList(),
    );
  }
}
