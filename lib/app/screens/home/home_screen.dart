import 'package:flutter/material.dart';
import 'package:tp_final/app/widgets/add_note_form.dart';
import 'package:tp_final/app/widgets/list_of_note.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                'MES NOTES',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AddNoteForm(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                'MES NOTES SAUVEGARDÉES',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListOfNotes(),
          ],
        ),
      ),
    );
  }
}
