import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/pages/feedpage/feed-add.dart';
import 'package:igreja_app/pages/home/home-module.dart';
import 'package:igreja_app/pages/login/tela-login-module.dart';

class FeedAddModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [HomeModule()];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const FeedAdd())];
}
