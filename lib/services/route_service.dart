import 'package:flutter_modular/flutter_modular.dart';

class RouteService {
  void logout() {
    Modular.to.navigate('/login/');
  }

  void login() {
    Modular.to.navigate('/login/');
  }

  void registerUser() {
    Modular.to.navigate('/register-user/');
  }

  void home() {
    Modular.to.navigate('/home/');
  }

  void feedAdd() {
    Modular.to.navigate('/feed-add/');
  }
}
