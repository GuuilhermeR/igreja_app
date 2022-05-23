import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 220, 10, 20),
        child: ListView(children: <Widget>[
          botaoConfig(const Text("Perfil"), const Icon(Icons.person, size: 25)),
          botaoConfig(
              const Text("Ao Vivo"), const Icon(Icons.live_tv, size: 25)),
        ]),
      ),
    );
  }
}

SizedBox botaoConfig(Text nomeBotao, Icon icon) {
  return SizedBox(
    height: 80,
    width: 600,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ElevatedButton.icon(
          onPressed: () {},
          icon: icon,
          label: nomeBotao,
          style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 108, 212, 253))),
    ),
  );
}
