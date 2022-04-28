import 'dart:convert';

import 'package:igreja_app/Models/User/user.dart';
import 'package:igreja_app/Repository/base_repository.dart';
import 'package:igreja_app/Services/jwt_service.dart';

import '../Models/CustomException/custom_exception.dart';
import '../Services/http_service.dart';

class BibliaRepository {
  static const String _route = "/login";

  Future<User?> get(User user) async {
    String methodRoute = '${"https://www.abibliadigital.com.br/api"}$_route';
    final response = await HttpService().post(
      methodRoute,
      user,
    );
    if (response.statusCode == 200) {
      JwtService jwtService = JwtService();
      jwtService.removeToken();
      jwtService.setToken(response.body.toString());
      return user;
    }
    CustomException customException =
        CustomException.fromJson(jsonDecode(response.body));
    throw customException.detail;
  }
}
