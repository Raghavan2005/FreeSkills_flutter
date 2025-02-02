import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../core/provider/PlayerState_Provider.dart';
import '../../core/provider/UserDataState_Provider.dart';
import '../../core/utils/Appusage.dart';
import '../routes/RoutesNames.dart';
import '../shared_widgets/ads_widgets/AdBanner.dart';
import '../shared_widgets/player_widgets/player_user_widget.dart';
import '../shared_widgets/player_widgets/player_widgets.dart';
import '../shared_widgets/player_widgets/ytdisplayer_widget.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key, this.item});

  final item;

  Future<void> onplayerstart(BuildContext c) async {
    Appusage au = Appusage();
    final usp = Provider.of<PlayerstateProvider>(c, listen: false);
    au.startserviceprogress(1);
    usp.updateonstart(c);
    usp.checksatues(item['lang_id'] + item['course_id'] + item['course_type']);
  }

  dynamic getitemdatavalue(BuildContext c, String id) {
    final value = Provider.of<UserdatastateProvider>(c, listen: false);
    return value.centraldataset[id];
  }

  // Function to handle back press
  Future<bool> onBackPressed(BuildContext context) async {
    //context.push(Routesnames.HomeScreen);// Navigate back to the previous screen
    return false;
    //return Future.value(false); // Prevent default behavior (going back to the system's default back action)
  }

  @override
  Widget build(BuildContext context) {
    final up = Provider.of<UserdatastateProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: onplayerstart(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Consumer<PlayerstateProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: PlayerWidgets(
                          playerurl: item["course_video_url"].toString(),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Offstage(
                          offstage: value.isFullscreen,
                          child: Visibility(
                            visible: !value.isFullscreen,
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
                                    lang: up.searchbykey(up.langinfo, item['lang_id']),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
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
                                // Replace Column and List.generate with ListView.builder for lazy loading
                                SizedBox(
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,  // Prevents the ListView from taking up more space than necessary
                                    physics: NeverScrollableScrollPhysics(), // Prevents scrolling conflict with parent scroll view
                                    itemCount: value.videolist.length,
                                    itemBuilder: (context, index) {
                                      var data = getitemdatavalue(context, value.videolist[index]);
                                      return YtdisplayerWidget(
                                        title: data['course_title'],
                                        channelname: data['course_channel_url'],
                                        lang: up.searchbykey(up.langinfo, data['lang_id']),
                                        date: data['video_timing'],
                                        videourl: data['course_video_url'],
                                        aka: data,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
