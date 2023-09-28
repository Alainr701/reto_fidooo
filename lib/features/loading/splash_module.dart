import 'package:reto/features/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) {
      Modular.get<AuthController>().autoLogin();
      return const Center(child: Text('Cargando sesión'));
    });
  }
}
