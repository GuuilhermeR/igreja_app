// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  String? videoId = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=BBAyRBTfsOU");

  int contador = 1;

  @override
  void initState() {
    super.initState();
  }

  _LivePageState createState() => _LivePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ListView.builder(
          itemCount: contador,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(8),
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: videoId.toString(),
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: true,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blue,
              progressColors: const ProgressBarColors(
                  playedColor: Colors.blue, handleColor: Colors.blueAccent),
            ),
          ),
        ),
      ),
    );
  }
}
