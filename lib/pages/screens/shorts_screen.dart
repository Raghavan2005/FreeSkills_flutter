import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late final YoutubePlayerController _controller;
  bool _isVideoLoaded = true;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'na4lArVuv1A',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    )..addListener(_videoPlayerListener);

    _controller.addListener(_videoPlayerListener);
  }

  void _videoPlayerListener() {
    if (_controller.value.isReady && !_isVideoLoaded) {
      setState(() {
        _isVideoLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoPlayerListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isVideoLoaded
        ? YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
            onEnded: (YoutubeMetaData data) {
              print('Video ended.');
            },
          )
        : CircularProgressIndicator();
  }
}

class AboutTopic extends StatefulWidget {
  final String videoLink;

  AboutTopic({required this.videoLink});

  @override
  _AboutTopicState createState() => _AboutTopicState();
}

class _AboutTopicState extends State<AboutTopic> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoLink,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: false,
          enableCaption: false),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      bottomActions: <Widget>[
        const SizedBox(width: 14.0),
        CurrentPosition(),
        const SizedBox(width: 8.0),
        ProgressBar(isExpanded: true),
        RemainingDuration(),
      ],
      aspectRatio: 4 / 3,
      progressIndicatorColor: Colors.white,
      onReady: () {
        print('Player is ready.');
      },
    );
  }
}
