import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Usuario {
  late String userId;
  late String password;
  late String nome;
  late String dataNasc;
}
