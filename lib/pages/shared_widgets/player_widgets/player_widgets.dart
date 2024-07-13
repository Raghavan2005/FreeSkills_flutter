// player_widgets.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      initialVideoId: 'VPvVD8t02U8',
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        hideControls: false,
        controlsVisibleAtStart: false,
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

    print(_controller.value.playbackQuality);
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

  void forceHD() {
    final webViewController = _controller.value.webViewController;

    if (webViewController != null) {
      webViewController.evaluateJavascript(
        source: 'player.setPlaybackQuality("hd720");',
      );
    }
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
        topActions: [
          Opacity(
            opacity: 0.5,
            // Change this value to set the desired opacity (0.0 to 1.0)
            child: Image.asset(
              "assets/icon/logo.png",
              width: 20.w,
              height: 20.h,
            ),
          )
        ],
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                  handleColor: Colors.greenAccent,
                  bufferedColor: Colors.grey,
                  playedColor: Colors.greenAccent,
                  backgroundColor: Colors.white38)),
          RemainingDuration(),
          SizedBox(
            width: 6,
          ),
          IconButton(
            onPressed: () {
              forceHD();
            },
            icon: Icon(
              Icons.hd,
              color: Colors.white,
            ),
          ),
          PlaybackSpeedButton(),
          FullScreenButton(),
        ],
        bufferIndicator: CircularProgressIndicator(),
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
