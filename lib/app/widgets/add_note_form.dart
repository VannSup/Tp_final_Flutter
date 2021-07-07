import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tp_final/app/widgets/take_picture_dialog.dart';
import 'package:tp_final/app/widgets/image_element.dart';

class AddNoteForm extends StatefulWidget {
  @override
  _AddNoteFormState createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _titreController = TextEditingController();
  final _contenuController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Picture scan
  String lastPictureStoredResult = '';

  @override
  void initState() {
    super.initState();
  }

  AutovalidateMode _autoValidateForm = AutovalidateMode.disabled;

  void addMyNote() async {}

  Future _showMyDialog() async {
    XFile? res = await showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CameraDialog(),
          ),
        );
      },
    );
    if (res != null) {
      print(res.path);
      changeLastPictureStoredResultValue(value: res.path);
    }
  }

  changeLastPictureStoredResultValue({String value = ""}) {
    print(value);
    setState(() {
      lastPictureStoredResult = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Form(
          autovalidateMode: _autoValidateForm,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  "NOUVELLE NOTE",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _titreController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Titre',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: _contenuController,
                  cursorColor: Colors.black,
                  minLines: 3,
                  maxLines: 6,
                  decoration: InputDecoration(
                    labelText: 'Contenu',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        shape: BeveledRectangleBorder(),
                      ),
                      onPressed: lastPictureStoredResult.isEmpty
                          ? _showMyDialog
                          : changeLastPictureStoredResultValue,
                      child: Text(
                        lastPictureStoredResult.isEmpty
                            ? 'Ajouter une image'
                            : 'Supprimer l\'image',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    lastPictureStoredResult.isEmpty
                        ? Container()
                        : ImageElement(
                            imagePath: lastPictureStoredResult,
                            width: 100,
                            height: 50,
                            borderSide: BorderSide(
                                color: Colors.grey.shade700, width: 3.0),
                          ),
                  ],
                ),
              ),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                    shape: BeveledRectangleBorder(),
                  ),
                  onPressed: addMyNote,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'AJOUTER MA NOTE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
