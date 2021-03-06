import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/AppComponent/router_outlet_widget.dart';
import 'package:igreja_app/pages/feedpage/feed-add-module.dart';
import 'package:igreja_app/pages/home/home-module.dart';
import 'package:igreja_app/pages/login/tela-login-module.dart';
import 'package:igreja_app/pages/register/register-user-module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
        HomeModule(),
        LoginModule(),
        RegisterUserModule(),
        FeedAddModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RouterOutletWidget(),
        ),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/register-user', module: RegisterUserModule()),
        ModuleRoute('/feed-add', module: FeedAddModule())
      ];
}
