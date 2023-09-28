import 'package:reto/features/auth/auth_controller.dart';
import 'package:reto/commons/controllers/device_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/features/sign_up/sign_up_controller.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(AuthController.new);
    i.addLazySingleton(SignUpController.new);
    i.addLazySingleton(DeviceController.new);
    super.binds(i);
  }
}
