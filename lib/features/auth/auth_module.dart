import 'dart:developer';

import 'package:reto/commons/controllers/device_controller.dart';
import 'package:reto/commons/format/page_format.dart';
import 'package:reto/features/auth/auth_controller.dart';
import 'package:reto/features/auth/view/login_page.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/features/auth/view/register_page.dart';

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
                Modular.to.navigate('/dashboard/user');
              }
            },
            onTap: () {
              Modular.to.navigate('/auth/sign_up');
            },
          ),
        );
      });
    });
    r.child(
      '/register',
      child: (context) {
        return Observer(builder: (context) {
          Modular.get<AuthController>().autoLogin();

          return DeviceListener(
            child: RegisterPage(
              device: Modular.get<DeviceController>().device,
              onSubmitted: (String name, String email, String password) async {
                bool status = await Modular.get<AuthController>()
                    .register(name, email, password);
                if (status) Modular.to.navigate('/dashboard/user');
              },
              onTap: () {
                Modular.to.navigate('/auth/register');
              },
            ),
          );
        });
      },
    );
  }
}
