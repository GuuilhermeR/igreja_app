import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore firestore;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String userId, String passw) async {
    try {
      await firestore
          .collection("Usuario")
          .add({'userId': userId, 'password': passw});
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String userId) async {
    try {
      await firestore.collection("Usuario").doc(userId).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('Usuarios').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"userId": doc["userId"], "password": doc["password"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> update(String userId, String pass) async {
    try {
      await firestore
          .collection("Usuarios")
          .doc(userId)
          .update({'userId': userId, 'password': pass});
    } catch (e) {
      print(e);
    }
  }
}
