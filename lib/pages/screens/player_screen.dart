import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/provider/MiniPlayerState_Provider.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

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
            Consumer<MiniplayerstateProvider>(
              builder: (BuildContext context, MiniplayerstateProvider value,
                  Widget? child) {
                return Stack(children: [
                  const PlayerWidgets(),
                  IconButton(
                      onPressed: () {
                        print("object");
                        value.controller.animateToHeight(
                          state: PanelState.MIN,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                      icon: Icon(
                        weight: 0.7,
                        CupertinoIcons.arrow_turn_right_down,
                        size: 17.sp,
                        color: Colors.white,
                      )),
                ]);
              },
            ),
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
            SizedBox(
              height: 0.02.sh,
            ),
            YtdisplayerWidget(),
            SizedBox(
              height: 0.02.sh,
            ),
            YtdisplayerWidget(),
            SizedBox(
              height: 0.02.sh,
            ),
          ],
        ),
      )),
      backgroundColor: Colors.black,
    );
  }
}
