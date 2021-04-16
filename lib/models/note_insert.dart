import 'package:flutter/foundation.dart';

//foundation imported for notation @required
class NoteManipulation {
  String noteTitle;
  String noteContent;

  NoteManipulation({
    @required this.noteTitle,
    @required this.noteContent,
  });

  Map<String, dynamic> toJson() {
    return {"noteTitle": noteTitle, "noteContent": noteContent};
  } //json data
}
