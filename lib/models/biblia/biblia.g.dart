// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biblia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Biblia _$BibliaFromJson(Map<String, dynamic> json) => Biblia(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BibliaToJson(Biblia instance) => <String, dynamic>{
      'data': instance.data,
    };
