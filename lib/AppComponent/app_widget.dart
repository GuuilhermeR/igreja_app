import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/AppComponent/router_outlet_controller.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouterOutletController())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'CELE - Jaraguá do Sul',
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        color: Colors.lightBlue,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
