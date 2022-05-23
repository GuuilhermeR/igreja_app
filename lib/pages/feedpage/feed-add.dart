import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CELE - Jaraguá do Sul'),
        centerTitle: true,
        toolbarHeight: 30,
      ),
    );
  }
}
