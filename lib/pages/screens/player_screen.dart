import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../core/provider/PlayerState_Provider.dart';
import '../../core/utils/Appusage.dart';
import '../shared_widgets/ads_widgets/AdBanner.dart';
import '../shared_widgets/player_widgets/player_user_widget.dart';
import '../shared_widgets/player_widgets/player_widgets.dart';
import '../shared_widgets/player_widgets/ytdisplayer_widget.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key, this.item});

  final item;

  @override
  Widget build(BuildContext context) {
    Appusage au = Appusage();
    au.startserviceprogress(1);
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
                  Center(
                      child: PlayerWidgets(
                    playerurl: item["course_video_url"].toString(),
                  )),
                  Offstage(
                    offstage: value.isFullscreen,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        AdBanner(
                          adSize: AdSize.fullBanner,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PlayerUserWidget(
                            itemdata: item,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        AdBanner(
                          adSize: AdSize.mediumRectangle,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 15.h,
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
