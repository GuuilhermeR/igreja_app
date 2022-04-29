// ignore_for_file: unnecessary_null_comparison, unnecessary_this

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Biblia {
  String? author;
  int? chapters;
  String? group;
  String? name;
  String? testament;

  Biblia({this.author, this.chapters, this.group, this.name, this.testament});

  fromJson(Map<String, dynamic> json) {
    author = json['author'];
    chapters = json['chapters'];
    group = json['group'];
    name = json['name'];
    testament = json['testament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = this.author;
    data['chapters'] = this.chapters;
    data['group'] = this.group;
    data['name'] = this.name;
    data['testament'] = this.testament;
    return data;
  }
}
