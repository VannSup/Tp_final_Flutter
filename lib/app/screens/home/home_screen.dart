import 'package:flutter/material.dart';
import 'package:tp_final/app/widgets/add_note_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
