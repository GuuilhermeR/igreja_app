import 'package:flutter/material.dart';
import 'package:igreja_app/models/repository/login_repository.dart';
import 'package:igreja_app/models/user/user.dart';

class LoginService {
  Future<User?> login(User user, BuildContext context) {
    LoginRepository loginRepository = LoginRepository();
    return loginRepository.login(user, context);
  }
}
