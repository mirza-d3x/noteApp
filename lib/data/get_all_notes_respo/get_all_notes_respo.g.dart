// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notes_respo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotesRespo _$GetAllNotesRespoFromJson(Map<String, dynamic> json) =>
    GetAllNotesRespo(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetAllNotesRespoToJson(GetAllNotesRespo instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
