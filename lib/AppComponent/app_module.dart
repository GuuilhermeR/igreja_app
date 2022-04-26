import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/AppComponent/router_outlet_controller.dart';
import 'package:igreja_app/AppComponent/router_outlet_widget.dart';
import 'package:igreja_app/pages/login/tela-login-module.dart';
import 'package:igreja_app/pages/register/register-user-module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => RouterOutletController(), export: true),
      ];

  @override
  List<Module> get imports => [
        LoginModule(),
        RegisterUserModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RouterOutletWidget(),
        ),
        // ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/register-user', module: RegisterUserModule())
      ];
}
