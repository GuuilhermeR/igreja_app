// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biblia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Biblia _$BibliaFromJson(Map<String, dynamic> json) => Biblia(
      json['id'] as String,
      bibleId: json['bibleId'] as String?,
      abbreviation: json['abbreviation'] as String?,
      name: json['name'] as String?,
      nameLong: json['nameLong'] as String?,
    );

Map<String, dynamic> _$BibliaToJson(Biblia instance) => <String, dynamic>{
      'id': instance.id,
      'bibleId': instance.bibleId,
      'abbreviation': instance.abbreviation,
      'name': instance.name,
      'nameLong': instance.nameLong,
    };
