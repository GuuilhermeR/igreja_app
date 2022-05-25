import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';

class FeedAdd extends StatefulWidget {
  const FeedAdd({Key? key}) : super(key: key);

  @override
  State<FeedAdd> createState() => _FeedAddPageState();
}

class _FeedAddPageState extends State<FeedAdd> {
  @override
  void initState() {
    super.initState();
  }

  final ZefyrController _controller = ZefyrController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CELE - Jguá do Sul'),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Título', hintText: 'Título'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, informe o título';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {});
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Sub Título', hintText: 'Sub Título'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, informe o sub título';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {});
                },
              ),
              ZefyrToolbar.basic(controller: _controller),
              Expanded(
                child: ZefyrEditor(
                  minHeight: 100,
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  controller: _controller,
                  // onLaunchUrl: _launchUrl,
                ),
              ),
              SizedBox(
                height: 40,
                width: 220,
                child: ElevatedButton.icon(
                  onPressed: () {
                    debugPrint(jsonEncode(_controller.document).toString());
                  },
                  icon: const Icon(Icons.publish, size: 25),
                  label: const Text("Publicar"),
                ),
              ),
            ],
          )),
    );
  }
}

// void _launchUrl(String url) async {
//   final result = await canLaunch(url);
//   if (result) {
//     await launch(url);
//   }
// }
