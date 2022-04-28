import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:igreja_app/models/biblia/biblia.dart';

class BibliaService {
  final dio = Dio();

  String URL_BIBLIA_API = "https://www.abibliadigital.com.br/api/";

  // Future<List<Biblia>> BuscarLivros(String livro) async {
  //   final response = await dio.get(URL_BIBLIA_API + livro);
  //   final List<dynamic> responseMap = jsonDecode(response.data);
  //   return responseMap.map<Biblia>((resp) => Biblia.fromMap(resp)).toList();
  // }
}
