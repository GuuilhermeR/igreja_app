import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:igreja_app/locator.dart';
import 'package:igreja_app/models/user/service/api.dart';
import 'package:igreja_app/models/user/models/user.dart';

class UserModel extends ChangeNotifier {
  final Api _api = locator<Api>();

  late List<User> users;

  Future<List<User>> fetchUsers() async {
    var result =
        await _api.getDataCollection() as QuerySnapshot<Map<dynamic, dynamic>>;
    users = result.docs.map((doc) => User.fromMap(doc.data())).toList();
    return users;
  }

  Stream<QuerySnapshot> fetchUsersAsStream() {
    return _api.streamDataCollection();
  }

  Future<User> getUserById(String id) async {
    var doc = await _api.getDocumentById(id);
    return User.fromMap();
  }

  Future removeUser(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateUser(User data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addUser(User data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }
}
