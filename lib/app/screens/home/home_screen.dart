import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tp_final/app/modules/note/data/repository/note_repository.dart';
import 'package:tp_final/app/modules/note/model/note_model.dart';
import 'package:tp_final/app/widgets/image_element.dart';
import 'package:tp_final/app/widgets/list_of_note.dart';
import 'package:tp_final/app/widgets/loading_element.dart';
import 'package:tp_final/app/widgets/take_picture_dialog.dart';
import 'package:tp_final/app/widgets/title_element.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final noteRepository = new NoteRepository();

  final _titreController = TextEditingController();
  final _contenuController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Picture path
  String lastPictureStoredResult = '';

  // Is Loading
  bool isLoading = false;

  // List of notes.
  List<Note> notes = [];

  notesValueChange() async {
    var notesFromDb = await noteRepository.retrieve();
    setState(() {
      notes = notesFromDb;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  AutovalidateMode _autoValidateForm = AutovalidateMode.disabled;

  void addMyNote() async {
    changeIsLoadingValue();

    //Pour voir le loading
    await Future.delayed(const Duration(seconds: 1));

    Note noteToSave = new Note(
      title: _titreController.text,
      dateTime: DateTime.now(),
      contenu: _contenuController.text,
      picturePath: lastPictureStoredResult,
    );

    _titreController.text = '';
    _contenuController.text = '';
    lastPictureStoredResult = '';

    print(noteToSave.toJson().toString());

    noteRepository.saveNote(noteToSave);
    notesValueChange();
    changeIsLoadingValue();
  }

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

  changeIsLoadingValue() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleElement(content: 'MES NOTES'),
            //AddNoteForm()
            isLoading
                ? LoadingElement(
                    height: 300,
                  )
                : Card(
                    shape: BeveledRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      child: Form(
                        autovalidateMode: _autoValidateForm,
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                                    borderRadius:
                                        const BorderRadius.all(Radius.zero),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        const BorderRadius.all(Radius.zero),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        const BorderRadius.all(Radius.zero),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                                    borderRadius:
                                        const BorderRadius.all(Radius.zero),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        const BorderRadius.all(Radius.zero),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        const BorderRadius.all(Radius.zero),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            color: Colors.grey.shade700,
                                            width: 3.0,
                                          ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                  ),
            TitleElement(
              content: 'MES NOTES SAUVEGARDÉES',
            ),
            ListOfNotes(
              notes: notes,
            ),
          ],
        ),
      ),
    );
  }
}
