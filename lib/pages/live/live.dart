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
    debugPrint(_controller.metadata.toString());
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(8),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blue,
                        progressColors: const ProgressBarColors(
                            playedColor: Colors.blue,
                            handleColor: Colors.blueAccent),
                      ),
                    ))));
  }
}
