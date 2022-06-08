// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_quill/flutter_quill.dart';

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

  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('CELE - Jguá do Sul'),
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
            SafeArea(
              child: Scaffold(
                  body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: QuillToolbar.basic(controller: _controller),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

// // void _launchUrl(String url) async {
// //   final result = await canLaunch(url);
// //   if (result) {
// //     await launch(url);
// //   }
// // }
