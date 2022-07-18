// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/pages/register/register-user.dart';

class RegisterUserModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const RegisterPage()),
      ];
}
