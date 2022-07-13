import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  late String userId;
  late String name;
  late String password;
  late String birthDate;

  User(userId, password, [name, birthDate]);

  User.fromMap(Map snapshot)
      : userId = snapshot['userId'] ?? '',
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
