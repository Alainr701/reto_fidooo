import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:reto/commons/data/user_entity.dart';

class FirestoreUser {
  final firestore.CollectionReference conversationsCollection =
      firestore.FirebaseFirestore.instance.collection("users");

  //create
  Future<void> createDataUser(UserEntity user) async {
    print('prueba : ');
    await conversationsCollection.doc().set(user.toJson());
  }
}
