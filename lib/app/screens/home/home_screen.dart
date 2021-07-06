import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tp_final/app/widgets/take_picture_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              padding: const EdgeInsets.all(8.0), child: CameraDialog()),
        );
      },
    );
    if (res != null) {
      lastPictureStoredResult = res.path;
    }
  }

  void _deletePicture() {
    lastPictureStoredResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            shape: BeveledRectangleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Form(
                autovalidateMode: _autoValidateForm,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _titreController,
                      decoration: InputDecoration(
                        labelText: 'Titre',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _contenuController,
                      minLines: 5,
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Contenu',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                          ),
                          onPressed: lastPictureStoredResult.isEmpty
                              ? _showMyDialog
                              : _deletePicture,
                          child: Text(
                            lastPictureStoredResult.isEmpty
                                ? 'Ajouter une image'
                                : 'Supprimer l\'image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        lastPictureStoredResult.isEmpty
                            ? Container()
                            : Image.file(
                                File(lastPictureStoredResult),
                                filterQuality: FilterQuality.low,
                                scale: 2,
                              ),
                      ],
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey[700],
                      ),
                      onPressed: addMyNote,
                      child: Text(
                        'AJOUTER MA NOTE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
