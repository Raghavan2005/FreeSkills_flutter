import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared_widgets/ads_widgets/ads_widget.dart';
import '../shared_widgets/player_widgets/player_user_widget.dart';
import '../shared_widgets/player_widgets/player_widgets.dart';
import '../shared_widgets/player_widgets/ytdisplayer_widget.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const PlayerWidgets(),
            const AdsWidgets(height: 0.07),
            SizedBox(
              height: 5.h,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const PlayerUserWidget(),
            SizedBox(
              height: 25.h,
            ),
            const AdsWidgets(height: 0.25),
            SizedBox(
              height: 25.h,
            ),
            YtdisplayerWidget(),
            YtdisplayerWidget(),
            YtdisplayerWidget()
          ],
        ),
      )),
      backgroundColor: Colors.black,
    );
  }
}
