import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/features/retrofid/retrofid_controller.dart';

class RetrofidModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(RetrofidController.new);
    super.binds(i);
  }
}
