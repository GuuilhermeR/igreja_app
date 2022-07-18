import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:igreja_app/models/CustomException/custom_exception.dart';
import 'package:igreja_app/models/repository/base_repository.dart';
import 'package:igreja_app/models/user/user.dart';
import 'package:igreja_app/services/http_service.dart';

class UserRepository {
  static const String _route = "/user";

  Future<User> createUser(User user, BuildContext context) async {
    String methodRoute = '${BaseRepository().urlBase}$_route';
    dynamic response = await HttpService().post(methodRoute, user, context);
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body.toString()));
    }
    CustomException customException =
        CustomException.fromJson(jsonDecode(response.data));
    throw customException.detail;
  }
}
