import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/services/jwt_service.dart';
import 'package:igreja_app/state/user_state.dart';
import 'package:provider/provider.dart';

class RouteService {
  void logout(BuildContext context) {
    JwtService jwtService = JwtService();
    jwtService.removeToken();
    Provider.of<UserState>(context, listen: false).changeLoginState(false);

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
