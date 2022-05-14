// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  late YoutubePlayerController _controller;

  String? videoId = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=BBAyRBTfsOU");

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  _LivePageState createState() => _LivePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
                const Card(
                  margin:
                      EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 60),
                  color: Colors.white,
                  child: Text('Ao Vivo - Culto Jaraguá do Sul'),
                ),
              ],
            );
          }),
    );
  }
}
