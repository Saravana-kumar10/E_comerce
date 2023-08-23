import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Youtube extends StatefulWidget {
  final String url;
  const Youtube({super.key,required this.url});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: widget.url,
            flags: YoutubePlayerFlags(
              autoPlay: true,
              mute: true,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
