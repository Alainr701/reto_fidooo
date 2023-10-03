import 'package:reto/features/auth/auth_controller.dart';
import 'package:reto/commons/controllers/device_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/features/retrofid/retrofid_controller.dart';
import 'package:reto/features/sign_up/sign_up_controller.dart';
import 'package:reto/features/user/user_controller.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(AuthController.new);
    i.addLazySingleton(SignUpController.new);
    i.addLazySingleton(DeviceController.new);
    i.addLazySingleton(UserController.new);
    // i.addLazySingleton(RetrofidController.new);
    super.binds(i);
  }
}
