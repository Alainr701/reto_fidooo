import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/commons/format/page_format.dart';
import 'package:reto/features/dashboard/dashboard_controller.dart';
import 'package:reto/features/dashboard/dashboard_page.dart';
import 'package:reto/features/retrofid/retrofid_controller.dart';
import 'package:reto/features/retrofid/retrofid_module.dart';
import 'package:reto/features/retrofid/retrofid_page.dart';
import 'package:reto/features/user/user_controller.dart';
import 'package:reto/features/user/user_page.dart';

class DashboardModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(DashboardController.new);
    i.addLazySingleton(RetrofidController.new);
    super.binds(i);
  }

  @override
  void routes(r) {
    r.child(
      '/user',
      child: (context) {
        return DeviceListener(
          child: DashboardPage(
            navigation: (navigation) {
              Modular.to.navigate('/dashboard/$navigation');
            },
            child: UserPage(
              onSubmitted: (p0, p1, p2, p3, p4) {
                Modular.get<UserController>().createUser(p0, p1, p2, p3, p4);
              },
            ),
          ),
        );
      },
    );
    r.child(
      '/retrofit',
      child: (context) {
        return DeviceListener(
          child: DashboardPage(
              navigation: (navigation) {
                Modular.to.navigate('/dashboard/$navigation');
              },
              child: const RetrofidPage()),
        );
      },
    );
  }
}
