import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/commons/format/page_format.dart';
import 'package:reto/features/auth/auth_controller.dart';
import 'package:reto/features/dashboard/dashboard_page.dart';
import 'package:reto/features/retrofid/retrofid_page.dart';
import 'package:reto/features/user/user_controller.dart';
import 'package:reto/features/user/user_page.dart';

class DashboardModule extends Module {
  // @override
  // void binds(Injector i) {
  //   i.addLazySingleton(DashboardController.new);
  //   super.binds(i);
  // }

  @override
  void routes(r) {
    // r.child(
    //   '/',
    //   child: (context) {
    //     Modular.get<AuthController>().autoLogin();
    //     return DeviceListener(
    //       child: DashboardPage(
    //         // navigation: (p0) {
    //         //   print('prueba : ');
    //         //   Modular.to.navigate('/dashboard/user/$p0');
    //         //   print('prueba : $p0');
    //         // },
    //         onTap: () async {
    //           final result = await Modular.get<AuthController>().logout();
    //           if (result) {
    //             Modular.to.navigate('/auth/login');
    //             return;
    //           }
    //         },
    //       ),
    //     );
    //   },
    // );
    r.child(
      '/user',
      child: (context) {
        Modular.get<AuthController>().autoLogin();
        return DeviceListener(
          child: DashboardPage(
            child: UserPage(
              onSubmitted: (p0, p1, p2, p3, p4) {
                print('prueba : ');
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
        Modular.get<AuthController>().autoLogin();
        return DeviceListener(
          child: RetrofidPage(),
        );
      },
    );
  }
}
