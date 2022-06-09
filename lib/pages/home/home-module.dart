// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/pages/home/home.dart';
import 'package:igreja_app/pages/login/tela-login-module.dart';
import 'package:igreja_app/pages/register/register-user-module.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/login', module: LoginModule()),
      ];
}
