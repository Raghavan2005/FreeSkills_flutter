import 'package:FreeSkills/pages/shared_widgets/player_widgets/responsivetextcontainer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlayerUserWidget extends StatelessWidget {
  const PlayerUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TITLE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 0.1.h,
            ),
            Row(
              children: [
                Text(
                  "@FreeCodeCamp",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "•",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Tamil",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "•",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "69:69:69",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveTextContainer(
                    text: 'Donate',
                    seticon: MdiIcons.cup,
                    fun: () => print("object"),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ResponsiveTextContainer(
                    text: 'Share',
                    seticon: Icons.share,
                    fun: () => print("object"),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ResponsiveTextContainer(
                    text: 'Save',
                    seticon: MdiIcons.bookmarkOutline,
                    fun: () => print("object"),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ResponsiveTextContainer(
                    text: 'Stop Ads',
                    seticon: MdiIcons.stopCircleOutline,
                    fun: () => print("object"),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ResponsiveTextContainer(
                    text: 'Report',
                    seticon: MdiIcons.flag,
                    fun: () => print("object"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
