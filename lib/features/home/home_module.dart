import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/commons/format/page_format.dart';
import 'package:reto/features/home/home_controller.dart';
import 'package:reto/features/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeController.new);
    super.binds(i);
  }

  @override
  void routes(r) {
    r.child('/home', child: (context) {
      log('Going to chats page');
      // final deviceController = Modular.get<DeviceController>();
      return const DeviceListener(
        child: HomePage(),
      );
    });
  }
}
