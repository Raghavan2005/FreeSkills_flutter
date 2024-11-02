import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/provider/PlayerState_Provider.dart';

class PlayerWidgets extends StatefulWidget {
  const PlayerWidgets({super.key, required this.playerurl});

  final String playerurl;

  @override
  State<PlayerWidgets> createState() => _PlayerWidgetsState();
}

class _PlayerWidgetsState extends State<PlayerWidgets> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.playerurl)!,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: true,
        hideControls: false,
        controlsVisibleAtStart: true,
        autoPlay: false,
        useHybridComposition: true,
        disableDragSeek: false,
        forceHD: false,
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

  void forceHD() {
    final webViewController = _controller.value.webViewController;

    if (webViewController != null) {
      webViewController.evaluateJavascript(
        source: 'player.setPlaybackQuality("hd1080");',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        topActions: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/icon/logo.png",
              width: 20,
              height: 20,
            ),
          )
        ],
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                  handleColor: Colors.greenAccent,
                  bufferedColor: Colors.grey,
                  playedColor: Colors.greenAccent,
                  backgroundColor: Colors.white38)),
          RemainingDuration(),
          const SizedBox(width: 6),
          IconButton(
            onPressed: forceHD,
            icon: const Icon(
              Icons.hd,
              color: Colors.white,
            ),
          ),
          PlaybackSpeedButton(),
          FullScreenButton(),
        ],
        bufferIndicator: const CircularProgressIndicator(),
        onReady: () {
          _controller.addListener(listener);
        },
      ),
      builder: (context, player) {
        return player;
      },
    );
  }
}
