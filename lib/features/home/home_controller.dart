import 'package:mobx/mobx.dart';
import 'package:reto/commons/enum.dart';
import 'package:reto/services/auth_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase();
  final FirebaseAuthService _authService = FirebaseAuthService();
  AuthStatus _authStatus = AuthStatus.loadingResources;

  @observable
  String? selectedId;

  Future<bool> logout() async {
    final status = await _authService.logout();
    if (status) {
      _authStatus = AuthStatus.unauthenticated;
    }
    return status;
  }
}
