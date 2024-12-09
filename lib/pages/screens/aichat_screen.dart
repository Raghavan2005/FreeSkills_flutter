import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';

import '../../core/services/NotificationService.dart';
import '../routes/RoutesNames.dart';
import '../shared_widgets/ads_widgets/AdBanner.dart';

class AichatScreen extends StatelessWidget {
  const AichatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 0.13.sh,
          backgroundColor: Colors.black,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    // Define your gradient colors here
                    tileMode: TileMode.clamp,
                  ).createShader(bounds);
                },
                child: Text(
                  "indhu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w600), // Adjust text color here
                ).tr(),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "beta",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600), // Adjust text color here
              ).tr()
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 0.24.sh,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'chat2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ).tr(),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.10.sw, vertical: 0.016.sh),
                        child: InkWell(
                          onTap: () {
                            context.push(Routesnames.ChatScreen);
                          },
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [Colors.redAccent, Colors.purpleAccent],
                                // Define your gradient colors here
                                tileMode: TileMode.clamp,
                              ).createShader(bounds);
                            },
                            child: Text(
                              "ask_now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight
                                      .bold), // Adjust text color here
                            ).tr(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            AdBanner(
              adSize: AdSize.fullBanner,
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'recent_chats',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ).tr(),
              ),
            ),
            ElevatedButton(
                onPressed: ()  {
                //  var box = Hive.box("UserData");
                 // box.delete("lastFetchDate");
                //  box.delete("centraldataset");
                   NotificationService().showNotificationBasedOnTime();
                },
                child: Text("clear"))
            //TODO:add recent chat item
          ],
        ),
      ),
    );
  }
}

///
///
///
///
