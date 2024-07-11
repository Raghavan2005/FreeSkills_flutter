import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerWidgets extends StatefulWidget {
  const PlayerWidgets({super.key});

  @override
  State<PlayerWidgets> createState() => _PlayerWidgetsState();
}

class _PlayerWidgetsState extends State<PlayerWidgets> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: const YoutubePlayerFlags(
        hideControls: false,
        controlsVisibleAtStart: false,
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onReady: () {
        _controller.play();
      },
    );
  }
}
