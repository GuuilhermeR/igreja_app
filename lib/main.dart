import 'package:igreja_app/pages/login/tela-login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/AppComponent/app_module.dart';
import 'package:igreja_app/AppComponent/app_widget.dart';

Future<void> main() async {
  Modular.setInitialRoute('/login/');
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IELB - SC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}
