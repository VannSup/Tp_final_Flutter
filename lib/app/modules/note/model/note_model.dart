class Note {
  Note({
    required this.title, // Titre
    required this.dateTime, // Date de création
    required this.contenu, // Contenu texte
    required this.picturePath, // Image
    this.id, // Id for sqflite
  });

  String title;
  final DateTime dateTime;
  final String contenu;
  final String picturePath;
  final int? id;

  static final cTitle = 'title';
  static final cDate = 'date';
  static final cContenu = 'contenu';
  static final cPicturePath = 'picture_path';
  static final cId = '_id';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data[cTitle] = this.title;
    data[cDate] = this.dateTime.microsecondsSinceEpoch.toString();
    data[cContenu] = this.contenu;
    data[cPicturePath] = this.picturePath;
    data[cId] = this.id;

    return data;
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return new Note(
      title: json[cTitle],
      dateTime: new DateTime.fromMicrosecondsSinceEpoch(int.parse(json[cDate])),
      contenu: json[cContenu],
      picturePath: json[cPicturePath],
      id: json[cId],
    );
  }
}
