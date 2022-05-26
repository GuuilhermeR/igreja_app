// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      json['imagem'] as String,
      json['titulo'] as String,
      json['subtitulo'] as String,
      json['texto'] as String,
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'imagem': instance.imagem,
      'titulo': instance.titulo,
      'subtitulo': instance.subtitulo,
      'texto': instance.texto,
    };
