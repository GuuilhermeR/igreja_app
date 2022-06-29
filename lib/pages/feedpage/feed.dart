// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:igreja_app/services/route_service.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Imagem"),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Spacer(),
                    Text("Olá, isso é um teste"),
                  ],
                ),
                onLongPress: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Aviso'),
                      content: const Text('Você deseja excluir essa postagem?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                            //deletar - apenas adm pode.
                          },
                          child: const Text('Sim'),
                        ),
                      ],
                    ),
                  );
                } //
                );
          },
        ),
        onRefresh: getFeed,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => RouteService.feedAdd(),
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future getFeed() async {}
