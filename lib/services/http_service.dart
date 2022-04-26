import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:igreja_app/Services/jwt_service.dart';
import 'package:igreja_app/Services/jwt_service.dart';

class HttpService {
  Future<dynamic> post(String url, dynamic object) async {
    Map<String, String> cabecalhos = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    JwtService jwtService = JwtService();
    String? jwtToken = await jwtService.getToken();
    if (jwtToken != null && jwtToken.isNotEmpty) {
      cabecalhos.addAll({'Authorization': "Bearer $jwtToken"});
    }

    return http.post(
      Uri.parse(url),
      headers: cabecalhos,
      body: jsonEncode(object.toJson()),
    );
  }

  Future<dynamic> get(String url) async {
    Map<String, String> cabecalhos = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    JwtService jwtService = JwtService();
    String? jwtToken = await jwtService.getToken();
    if (jwtToken != null && jwtToken.isNotEmpty) {
      cabecalhos.addAll({'Authorization': "Bearer $jwtToken"});
    }

    return http.get(
      Uri.parse(url),
      headers: cabecalhos,
    );
  }
}
