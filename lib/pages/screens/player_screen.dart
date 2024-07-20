import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/provider/PlayerState_Provider.dart';
import '../../core/utils/Appusage.dart';
import '../shared_widgets/ads_widgets/ads_widget.dart';
import '../shared_widgets/player_widgets/player_user_widget.dart';
import '../shared_widgets/player_widgets/player_widgets.dart';
import '../shared_widgets/player_widgets/ytdisplayer_widget.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Appusage au = Appusage();
    au.startserviceprogress();
    return Scaffold(
      body: SafeArea(
        child: Consumer<PlayerstateProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return SingleChildScrollView(
              physics:
                  value.isFullscreen ? NeverScrollableScrollPhysics() : null,
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: const PlayerWidgets()),
                  Offstage(
                    offstage: value.isFullscreen,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        AdsWidgets(height: 0.07),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const PlayerUserWidget(),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        AdsWidgets(height: 0.25),
                        SizedBox(
                          height: 25.h,
                        ),
                        const YtdisplayerWidget(
                          title: 'sdfsdf',
                          channelname: 'dsfsdf',
                          lang: 'dsfdsfsd',
                        ),
                        const YtdisplayerWidget(
                          title: 'sdfsdf',
                          channelname: 'dsfsdf',
                          lang: 'dsfdsfsd',
                        ),
                        const YtdisplayerWidget(
                          title: 'sdfsdf',
                          channelname: 'dsfsdf',
                          lang: 'dsfdsfsd',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
