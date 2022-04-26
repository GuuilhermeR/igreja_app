import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/Services/jwt_service.dart';

class RouteService {
  void logout() {
    JwtService jwtService = JwtService();
    jwtService.removeToken();

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
}
