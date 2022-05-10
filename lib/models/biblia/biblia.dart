// ignore_for_file: unnecessary_null_comparison, unnecessary_this

import 'package:json_annotation/json_annotation.dart';

part 'biblia.g.dart';

@JsonSerializable()
class Biblia {
  String id;
  String bibleId;
  String abbreviation;
  String name;
  String nameLong;

  Biblia(this.id, this.bibleId, this.abbreviation, this.name, this.nameLong);

  factory Biblia.fromJson(Map<String, dynamic> json) => _$BibliaFromJson(json);
  Map<String, dynamic> toJson() => _$BibliaToJson(this);
}
