// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/AppComponent/router_outlet_controller.dart';
import 'package:provider/provider.dart';

class RouterOutletWidget extends StatefulWidget {
  const RouterOutletWidget({Key? key}) : super(key: key);

  @override
  State<RouterOutletWidget> createState() => _RouterOutletWidgetState();
}

class _RouterOutletWidgetState extends State<RouterOutletWidget> {
  @override
  Widget build(BuildContext context) {
    RouterOutletController controller =
        Provider.of<RouterOutletController>(context);

    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: RouterOutlet(),
    );
  }
}
