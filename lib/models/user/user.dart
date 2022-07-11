import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Usuario {
  late String userId;
  late String name;
  late String password;
  late String birthDate;

  Usuario(userId, password, [name, birthDate]);

  Usuario.fromMap(Map snapshot, String id)
      : userId = id,
        name = snapshot['name'] ?? '',
        password = snapshot['password'] ?? '',
        birthDate = snapshot['birthDate'] ?? '';

  toJson() {
    return {
      "userId": userId,
      "name": name,
      "password": password,
      "birthDate": birthDate,
    };
  }

  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
