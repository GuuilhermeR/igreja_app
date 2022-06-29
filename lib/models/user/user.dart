import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:igreja_app/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Usuario extends BaseModel {
  late String _documentId;
  late String userId;
  late String name;
  late String password;
  late String birthDate;

  Usuario(userId, password, [name, birthDate]);

  Usuario.fromMap(DocumentSnapshot document) {
    _documentId = document.id;

    userId = document['userId'] ?? '';
    name = document['name'] ?? '';
    password = document['password'] ?? '';
    birthDate = document['birthDate'] ?? '';
  }

  @override
  toMap() {
    var map = <String, dynamic>{};
    map['userId'] = userId;
    map['name'] = name;
    map['password'] = password;
    map['password'] = birthDate;
    return map;
  }

  @override
  String documentId() => _documentId;

  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
