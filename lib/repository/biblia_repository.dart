// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:igreja_app/models/biblia/biblia.dart';

import '../Models/CustomException/custom_exception.dart';
import '../Services/http_service.dart';

class BibliaRepository {
  String URL_BIBLIA_API = "https://api.scripture.api.bible/v1";
  static const String _route = "/bibles/d63894c8d9a7a503-01/books";

  Future<Biblia> getAllBookChap() async {
    String methodRoute = '$URL_BIBLIA_API$_route';

    final response = await HttpService().get(methodRoute);

    // if (response.statusCode == 200) {
    //   Biblia biblia = Biblia.fromJson(jsonDecode(response.body));
    //   return biblia;
    // }

    CustomException customException =
        CustomException.fromJson(jsonDecode(response.body));
    throw customException.detail;
  }
}
