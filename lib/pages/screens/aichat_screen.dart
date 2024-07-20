import 'package:FreeSkills/pages/shared_widgets/ads_widgets/ads_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../routes/RoutesNames.dart';

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
                  "Indhu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w600), // Adjust text color here
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Beta",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600), // Adjust text color here
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 0.2.sh,
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
                      'Hello! Feel Free to Ask Me Anything',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.10.sw, vertical: 0.013.sh),
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
                              "Ask Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight
                                      .bold), // Adjust text color here
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            AdsWidgets(height: 0.08),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Chats',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

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
