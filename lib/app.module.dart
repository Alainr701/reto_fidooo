import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/features/auth/auth_module.dart';
import 'package:reto/features/core/core_module.dart';
import 'package:reto/features/dashboard/dashboard_module.dart';
import 'package:reto/features/loading/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/auth', module: AuthModule());
    r.module('/dashboard', module: DashboardModule());
  }
}
