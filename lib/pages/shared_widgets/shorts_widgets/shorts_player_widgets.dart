import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortsPlayerWidgets extends StatefulWidget {
  const ShortsPlayerWidgets({super.key, required this.videoid});

  final String videoid;

  @override
  State<ShortsPlayerWidgets> createState() => _ShortsPlayerWidgetsState();
}

class _ShortsPlayerWidgetsState extends State<ShortsPlayerWidgets> {
  late YoutubePlayerController _controller;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoid,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        controlsVisibleAtStart: false,
        mute: false,
      ),
    );
    _controller.addListener(() {
      if (_controller.value.isReady && !isLoaded) {
        setState(() {
          isLoaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          YoutubePlayer(
            aspectRatio: 16 / 1.sw,
            controller: _controller,
            showVideoProgressIndicator: false,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
          Positioned(
            top: 15.0.h,
            right: 20.w,
            child: Image.asset('assets/icon/logo.png', width: 40, height: 40),
          ),
          Center(
            child: Visibility(
              visible: !isLoaded,
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
