import 'package:flutter/material.dart';
import 'package:tp_final/app/modules/note/model/note_model.dart';
import 'package:tp_final/app/widgets/image_element.dart';
import 'package:tp_final/app/widgets/title_element.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                TitleElement(
                  content: 'MES NOTES',
                ),
              ],
            ),
            TitleElement(
              content: '${note.title} # ${note.id} ',
            ),
            Text(
              '${note.dateTime.day} - ${note.dateTime.month + 1} - ${note.dateTime.year}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 42),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                note.contenu,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
    );
  }
}
