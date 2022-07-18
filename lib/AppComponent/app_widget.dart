import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/state/user_state.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserState(),
        ),
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
