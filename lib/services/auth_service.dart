import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = "";

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  String get error => _errorMessage;

  Future<User?> getCurrentAuthUser() async {
    return await _auth.authStateChanges().first;
  }

  Future<bool> signInEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      log(e.toString());
      _errorMessage = translateAuthError(e as FirebaseAuthException);
      log(_errorMessage);
      return false;
    }
  }

  Future<bool> signUpEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      _errorMessage = translateAuthError(e as FirebaseAuthException);
      log(_errorMessage);
      return false;
    }
  }

  String translateAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case "invalid-email":
        return "Wrong mail format";
      case "wrong-password":
        return "Wrong password";
      case "user-not-found":
        return "User not found";
      default:
        return "Error";
    }
  }
}
