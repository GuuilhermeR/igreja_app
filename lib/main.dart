import 'package:igreja_app/pages/home/home.dart';
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
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 98, 178, 243),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // darkTheme: ThemeData(
      //   primaryColor: const Color.fromARGB(255, 13, 76, 128),
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
    );
  }
}
