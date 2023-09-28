import 'dart:developer';

import 'package:reto/commons/controllers/device_controller.dart';
import 'package:reto/commons/format/page_format.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/features/sign_up/sign_up.dart';
import 'package:reto/features/sign_up/sign_up_controller.dart';

class SignUpModule extends Module {
  @override
  void routes(r) {
    r.child('/sign_up', child: (context) {
      log('Going to login page');
      return Observer(builder: (context) {
        return DeviceListener(
          child: SignUpPage(
            device: Modular.get<DeviceController>().device,
            onSubmitted: (String name, String email, String password) async {
              bool status = await Modular.get<SignUpController>()
                  .register(name, email, password);
              if (status) {
                Modular.to.navigate('/home');
              }
            },
            onTap: () {
              Modular.to.navigate('/auth/login');
            },
          ),
        );
      });
    });
  }
}
