import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:igreja_app/Services/jwt_service.dart';
import 'package:igreja_app/models/CustomException/custom_exception.dart';
import 'package:igreja_app/models/repository/base_repository.dart';
import 'package:igreja_app/models/user/user.dart';
import 'package:igreja_app/services/http_service.dart';

class LoginRepository {
  static const String _route = "/login";

  Future<User?> login(User user, BuildContext context) async {
    String methodRoute = '${BaseRepository().urlBase}$_route';
    final response = await HttpService().post(
      methodRoute,
      user,
      context,
    );
    debugPrint("response: " + response.toString());
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
