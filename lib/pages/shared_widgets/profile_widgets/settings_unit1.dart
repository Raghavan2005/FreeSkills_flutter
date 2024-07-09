import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routes/RoutesNames.dart';

class SettingsUnit1 extends StatelessWidget {
  const SettingsUnit1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.video_collection_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Saved Videos",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.workspace_premium,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Get Premium",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routesnames.SettingsScreen);
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.help_center,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Help and Feedback",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
