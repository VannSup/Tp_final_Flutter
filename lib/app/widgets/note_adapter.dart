import 'package:flutter/material.dart';
import 'package:tp_final/app/modules/note/model/note_model.dart';
import 'package:tp_final/app/widgets/image_element.dart';

import '../../app_routes.dart';

class NoteAdapter extends StatelessWidget {
  const NoteAdapter({required this.note});

  final Note note;

  void navigateToDetailsScreen(context, Note note) {
    Navigator.pushNamed(context, kHomeDetailsRoute, arguments: note);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToDetailsScreen(context, note),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${note.title} # ${note.id} ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                  '${note.dateTime.day} - ${note.dateTime.month + 1} - ${note.dateTime.year}',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.contenu,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: note.picturePath.isNotEmpty
                    ? ImageElement(
                        imagePath: note.picturePath,
                        height: 150,
                        width: 400,
                        radius: 0,
                      )
                    : Container(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  width: 250,
                  height: 4,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
