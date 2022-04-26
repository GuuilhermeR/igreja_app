import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/pages/register/register-user.dart';

class RegisterUserModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const RegisterPage()),
      ];
}