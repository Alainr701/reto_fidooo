import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:reto/commons/data/user_entity.dart';

class FirestoreUser {
  final firestore.CollectionReference conversationsCollection =
      firestore.FirebaseFirestore.instance.collection("users");

  Future<void> createDataUser(UserEntity user) async {
    await conversationsCollection.doc().set(user.toJson());
  }
}
