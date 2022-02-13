import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'content')
  String? content;

  NoteModel({this.id, this.title, this.content});

  NoteModel.create({
    required this.id,
    required this.title,
    required this.content,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return _$NoteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
