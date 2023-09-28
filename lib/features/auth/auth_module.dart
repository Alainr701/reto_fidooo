import 'dart:developer';

import 'package:reto/commons/controllers/device_controller.dart';
import 'package:reto/commons/format/page_format.dart';
import 'package:reto/features/auth/auth_controller.dart';
import 'package:reto/features/auth/login_page.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/login', child: (context) {
      // Modular.get<AppFirebaseDataSource>()
      log('Going to login page');
      return Observer(builder: (context) {
        return DeviceListener(
          child: LoginPage(
            device: Modular.get<DeviceController>().device,
            onSubmitted: (String email, String password) async {
              bool status = await Modular.get<AuthController>()
                  .signInEmail(email, password);
              if (status) {
                Modular.to.navigate('/home');
              }
            },
            onTap: () {
              Modular.to.navigate('/auth/sign_up');
            },
          ),
        );
      });
    });
  }
}
