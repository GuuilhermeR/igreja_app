import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  final String imagem;
  final String titulo;
  final String subtitulo;
  final String texto;

  Feed(this.imagem, this.titulo, this.subtitulo, this.texto);

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
