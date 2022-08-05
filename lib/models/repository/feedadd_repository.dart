import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:igreja_app/models/CustomException/custom_exception.dart';
import 'package:igreja_app/models/repository/base_repository.dart';
import 'package:igreja_app/models/user/user.dart';
import 'package:igreja_app/services/http_service.dart';

class FeedAddRepository {
  static const String _route = "/feed-add/add";

  Future<User> createInfo(User user, BuildContext context) async {
    String methodRoute = '${BaseRepository().urlBase}$_route/add';
    dynamic response = await HttpService().post(methodRoute, user, context);
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body.toString()));
    }
    CustomException customException =
        CustomException.fromJson(jsonDecode(response.data));
    throw customException.detail;
  }

  Future<User> deleteInfo(User user, BuildContext context) async {
    String methodRoute = '${BaseRepository().urlBase}$_route/delete';
    dynamic response = await HttpService().post(methodRoute, user, context);
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body.toString()));
    }
    CustomException customException =
        CustomException.fromJson(jsonDecode(response.data));
    throw customException.detail;
  }

  Future<User> updateInfo(User user, BuildContext context) async {
    String methodRoute = '${BaseRepository().urlBase}$_route/update';
    dynamic response = await HttpService().post(methodRoute, user, context);
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body.toString()));
    }
    CustomException customException =
        CustomException.fromJson(jsonDecode(response.data));
    throw customException.detail;
  }
}
