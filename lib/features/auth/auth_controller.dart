import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:reto/commons/enum.dart';
import 'package:reto/services/auth_service.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  AuthControllerBase() {
    autoLogin();
  }

  AuthStatus _authStatus = AuthStatus.loadingResources;

  update(AuthStatus authStatus, prevUserPublicProvider) {
    if (authStatus == AuthStatus.authenticated) {}
  }

  final FirebaseAuthService _authService = FirebaseAuthService();

  User? _userAuth;
  String? token;

  UserStatus _userStatus = UserStatus.loading;

  User? get userAuth => _userAuth;

  AuthStatus get status {
    return _authStatus;
  }

  UserStatus get userStatus {
    return _userStatus;
  }

  Future<bool> signInEmail(String email, String password) async {
    return await _authService.signInEmail(email, password);
  }

  String get error => _authService.error;

  Future<UserStatus> autoLogin({bool justLoggedIn = false}) async {
    _userAuth = await _authService.getCurrentAuthUser();

    if (_userAuth == null) {
      _userStatus = UserStatus.signedOut;
      await logout();
      Modular.to.navigate('/auth/login');
      return _userStatus;
    } else {
      token = await _userAuth!.getIdToken();
      _authStatus = AuthStatus.authenticated;
      // Modular.to.navigate('/chats/');
      Modular.to.navigate('/home');
    }
    _userStatus = UserStatus.active;
    return _userStatus;
  }

  Future<bool> logout() async {
    final status = await _authService.logout();
    if (status) {
      _authStatus = AuthStatus.unauthenticated;
    }
    return status;
  }
}
