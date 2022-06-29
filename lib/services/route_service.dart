import 'package:flutter_modular/flutter_modular.dart';

class RouteService {
  static void logout() {
    Modular.to.navigate('/login/');
  }

  static void login() {
    Modular.to.navigate('/login/');
  }

  static void registerUser() {
    Modular.to.navigate('/register-user/');
  }

  static void home() {
    Modular.to.navigate('/home/');
  }

  static void feedAdd() {
    Modular.to.navigate('/feed-add/');
  }
}
