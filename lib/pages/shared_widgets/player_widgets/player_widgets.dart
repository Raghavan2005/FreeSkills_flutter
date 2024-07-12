// player_widgets.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/provider/PlayerState_Provider.dart';

class PlayerWidgets extends StatefulWidget {
  const PlayerWidgets({super.key});

  @override
  State<PlayerWidgets> createState() => _PlayerWidgetsState();
}

class _PlayerWidgetsState extends State<PlayerWidgets> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'B_Ffu0CPYJ4',
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        hideControls: false,
        controlsVisibleAtStart: false,
        autoPlay: false,
        useHybridComposition: true,
        disableDragSeek: false,
        mute: false,
      ),
    )..addListener(listener);
  }

  void listener() {
    final fullscreenProvider =
        Provider.of<PlayerstateProvider>(context, listen: false);
    if (_controller.value.isFullScreen != fullscreenProvider.isFullscreen) {
      fullscreenProvider.updateIsFullscreen(_controller.value.isFullScreen);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    super.dispose();
  }

  double getwidth() {
    final fullscreenProvider =
        Provider.of<PlayerstateProvider>(context, listen: false);
    double width;

    if (fullscreenProvider.isFullscreen) {
      width = MediaQuery.of(context).size.width -
          0.2 * MediaQuery.of(context).size.width;
    } else {
      // If not in fullscreen mode, use the full width.
      width = MediaQuery.of(context).size.width;
    }

    return width;
  }

  @override
  Widget build(BuildContext context) {
    final fullscreenProvider =
        Provider.of<PlayerstateProvider>(context, listen: false);
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        width: getwidth(),
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          _controller.addListener(listener);
          _controller.play();
        },
      ),
      builder: (context, player) {
        return player;
      },
    );
  }
}
