// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';

import 'package:igreja_app/models/biblia/biblia.dart';

import '../Models/CustomException/custom_exception.dart';
import '../Services/http_service.dart';

import 'package:http/http.dart' as http;

class BibliaRepository {
  static const String url_biblia_api = "https://api.scripture.api.bible/v1";
  static const String _route = "/bibles/d63894c8d9a7a503-01/books";
  static const String methodRoute = '$url_biblia_api$_route';

  Future<List<Biblia>> getAllBookChap() async {
    final response = await HttpService().post(methodRoute, {});

    if (response.statusCode == 200) {
      var tagObjsJson = jsonDecode(response.body)['data'] as List;
      List<Biblia> tagObjs =
          tagObjsJson.map((tagJson) => Biblia.fromJson(tagJson)).toList();
      return tagObjs;
    }

    CustomException customException =
        CustomException.fromJson(jsonDecode(response.body));
    throw customException.detail;
  }
}
