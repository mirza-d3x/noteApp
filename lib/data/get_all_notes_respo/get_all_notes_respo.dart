import 'package:json_annotation/json_annotation.dart';
import 'package:note_app_sample/data/note_model/note_model.dart';


part 'get_all_notes_respo.g.dart';

@JsonSerializable()
class GetAllNotesRespo {


  @JsonKey(name: 'data')
  List<NoteModel> data;

  GetAllNotesRespo({this.data = const []});

  factory GetAllNotesRespo.fromJson(Map<String, dynamic> json) {
    return _$GetAllNotesRespoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllNotesRespoToJson(this);
}
