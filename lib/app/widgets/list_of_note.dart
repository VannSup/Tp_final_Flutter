import 'package:flutter/material.dart';
import 'package:tp_final/app/modules/note/data/repository/note_repository.dart';
import 'package:tp_final/app/modules/note/model/note_model.dart';
import 'package:tp_final/app/widgets/note_adapter.dart';

class ListOfNotes extends StatefulWidget {
  @override
  _ListOfNotesState createState() => _ListOfNotesState();
}

class _ListOfNotesState extends State<ListOfNotes> {
  final noteRepository = new NoteRepository();

  List<Note> notes = /*[]*/ [
    new Note(
        title: 'COURS DE PHILO',
        dateTime: DateTime.now(),
        contenu:
            'Qui cum venisset ob haec festinatis itineribus Antiochiam, praestrictis palatii ianuis, contempto Caesare, quem videri decuerat, ad praetorium cum pompa sollemni perrexit morbosque diu causatus nec regiam introiit nec processit in publicum, sed abditus multa in eius moliebatur exitium addens quaedam relationibus supervacua, quas subinde dimittebat ad principem. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.Ideo urbs venerabilis post superbas efferatarum gentium cervices oppressas latasque leges fundamenta libertatis et retinacula sempiterna velut frugi parens et prudens et dives Caesaribus tamquam liberis suis regenda patrimonii iura permisit.',
        picturePath: '',
        id: 0),
    new Note(
        title: 'COURS DE PHILO',
        dateTime: DateTime.now(),
        contenu:
            'Qui cum venisset ob haec festinatis itineribus Antiochiam, praestrictis palatii ianuis, contempto Caesare, quem videri decuerat, ad praetorium cum pompa sollemni perrexit morbosque diu causatus nec regiam introiit nec processit in publicum, sed abditus multa in eius moliebatur exitium addens quaedam relationibus supervacua, quas subinde dimittebat ad principem. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.Ideo urbs venerabilis post superbas efferatarum gentium cervices oppressas latasque leges fundamenta libertatis et retinacula sempiterna velut frugi parens et prudens et dives Caesaribus tamquam liberis suis regenda patrimonii iura permisit.',
        picturePath: '',
        id: 1),
    new Note(
        title: 'COURS DE PHILO',
        dateTime: DateTime.now(),
        contenu:
            'Qui cum venisset ob haec festinatis itineribus Antiochiam, praestrictis palatii ianuis, contempto Caesare, quem videri decuerat, ad praetorium cum pompa sollemni perrexit morbosque diu causatus nec regiam introiit nec processit in publicum, sed abditus multa in eius moliebatur exitium addens quaedam relationibus supervacua, quas subinde dimittebat ad principem. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.Ideo urbs venerabilis post superbas efferatarum gentium cervices oppressas latasque leges fundamenta libertatis et retinacula sempiterna velut frugi parens et prudens et dives Caesaribus tamquam liberis suis regenda patrimonii iura permisit.',
        picturePath:
            '', //'/data/user/0/com.example.tp_final/cache/CAP6536044492856940831.jpg',
        id: 2)
  ];

  /*notesValueChange() async {
    setState(() {
      noteRepository.retrieve().then((value) => notes.addAll(value));
    });
  }

  deleteAllNote() async {
    noteRepository.deleteAllNote();
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.grey.shade700,
            shape: BeveledRectangleBorder(),
          ),
          onPressed: notesValueChange,
          child: Text(
            'Teste',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.grey.shade700,
            shape: BeveledRectangleBorder(),
          ),
          onPressed: deleteAllNote,
          child: Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),*/
        Column(
          children: notes.map((note) => NoteAdapter(note: note)).toList(),
        )
      ],
    );
  }
}
