import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/features/auth/auth_module.dart';
import 'package:reto/features/core/core_module.dart';
import 'package:reto/features/home/home_module.dart';
import 'package:reto/features/loading/splash_module.dart';
import 'package:reto/features/sign_up/sign_up_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/auth', module: AuthModule());
    r.module('/auth', module: SignUpModule());
    r.module('', module: HomeModule());
  }
}
