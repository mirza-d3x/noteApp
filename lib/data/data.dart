import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:note_app_sample/data/get_all_notes_respo/get_all_notes_respo.dart';
import 'package:note_app_sample/data/note_model/note_model.dart';
import 'package:note_app_sample/data/url.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>> getAllNotes();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<void> deleteNote(String id);
}

class NoteDB extends ApiCalls {
  final dio = Dio();
  final url = Url();

  NoteDB() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
    );
  }

  @override
  Future<NoteModel?> createNote(NoteModel value) async {
    try {
      final _result = await dio.post(
        url.createNote,
        data: value.toJson(),
      );
      final _resultAsJson = jsonDecode(_result.data);
      return NoteModel.fromJson(_resultAsJson as Map<String, dynamic>);
    } on DioError catch (e) {
      print(e.response?.data);
      print(e);
      return null;
    } catch (e) {
      return null;
      print(e.toString());
    }
  }

  @override
  Future<void> deleteNote(String id) async {}

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final _result = await dio.get(url.baseUrl + url.getAllNote);
    if (_result.data != null) {
      final _resultAsJson = jsonDecode(_result.data);
      final getNoteResp = GetAllNotesRespo.fromJson(_resultAsJson);
      return getNoteResp.data;
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
