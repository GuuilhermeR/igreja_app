// ignore_for_file: unnecessary_null_comparison, unnecessary_this

import 'package:json_annotation/json_annotation.dart';

part 'biblia.g.dart';

@JsonSerializable()
class Biblia {
  List<Data>? data;

  Biblia({this.data});

  factory Biblia.fromJson(Map<String, dynamic> json) => _$BibliaFromJson(json);
  Map<String, dynamic> toJson() => _$BibliaToJson(this);
}

class Data {
  String? id;
  String? bibleId;
  String? abbreviation;
  String? name;
  String? nameLong;

  Data({this.id, this.bibleId, this.abbreviation, this.name, this.nameLong});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bibleId = json['bibleId'];
    abbreviation = json['abbreviation'];
    name = json['name'];
    nameLong = json['nameLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['bibleId'] = this.bibleId;
    data['abbreviation'] = this.abbreviation;
    data['name'] = this.name;
    data['nameLong'] = this.nameLong;
    return data;
  }
}
