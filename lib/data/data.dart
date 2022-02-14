import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:note_app_sample/data/get_all_notes_respo/get_all_notes_respo.dart';
import 'package:note_app_sample/data/note_model/note_model.dart';
import 'package:note_app_sample/data/url.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>> getAllData();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<void> deleteNote(String id);
}

class NoteDB extends ApiCalls {
  final dio = Dio();
  final url = Url();
  @override
  Future<NoteModel?> createNote(NoteModel value) async {
    final _result = await dio.post<NoteModel>(url.baseUrl + url.createNote);
    return _result.data;
  }

  @override
  Future<void> deleteNote(String id) async {}

  @override
  Future<List<NoteModel>> getAllData() async {
    final _result =
        await dio.get<GetAllNotesRespo>(url.baseUrl + url.getAllNote);
    if (_result.data == null) {
      return [];
    } else {
      return _result.data!.data;
    }
  }

  @override
  Future<NoteModel?> updateNote(NoteModel value) async {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
