import 'package:vsc_apitrial/models/api_response.dart';
import 'package:vsc_apitrial/models/note_for_listing.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';

class NotesService {
  //static const API = 'http://api.notes.programmingaddict.com';
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes';
  static const headers = {'apiKey': 'dad64144-f705-4616-be79-e43e8709dd2d'};
//+ '/vsc_apitrial'
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(Uri.parse(API), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          // <>
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }
}
