// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:igreja_app/Models/User/user.dart';
import 'package:igreja_app/Services/login_service.dart';
import 'package:igreja_app/Widgets/custom_toast.dart';
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
    return RefreshIndicator(
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
            onTap: () {},
            onLongPress: () {
              // delete(context, index, data[index]);
            },
          );
        },
      ),
      onRefresh: getFeed,
    );
  }
}

Future getFeed() async {}
