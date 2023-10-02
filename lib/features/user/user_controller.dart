import 'package:firebase_auth/firebase_auth.dart';
import 'package:reto/commons/data/user_entity.dart';
import 'package:reto/services/firestore/firestore_user.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  UserControllerBase();
  UserEntity? _userData;
  final FirestoreUser _firestoreUser = FirestoreUser();

  //create
  void createUser(
      String name, String age, String state, String date, String gender) async {
    _userData = UserEntity(
      name: name,
      age: int.parse(age),
      state: state,
      // date: DateTime.parse(date),
      gender: gender,
    );
    await _firestoreUser.createDataUser(_userData!);
  }
}
