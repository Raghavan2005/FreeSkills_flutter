import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FreeSkills/pages/shared_widgets/player_widgets/responsivetextcontainer_widget.dart';

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
            SizedBox(
              height: 5.h,
            ),
            Text(
              "TITLE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveTextContainer(
                  text: 'FreeCodeCamp',
                  seticon: Icons.icecream,
                  fun: () => print("object"),
                ),
                ResponsiveTextContainer(
                  text: 'Tamil',
                  seticon: Icons.language,
                  fun: () => print("object"),
                ),
                ResponsiveTextContainer(
                  text: '1:00:00',
                  seticon: Icons.timelapse,
                  fun: () => print("object"),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveTextContainer(
                  text: '10',
                  seticon: Icons.front_hand,
                  fun: () => print("object"),
                ),
                ResponsiveTextContainer(
                  text: 'Share',
                  seticon: Icons.share,
                  fun: () => print("object"),
                ),
                ResponsiveTextContainer(
                  text: 'Save',
                  seticon: Icons.save_as,
                  fun: () => print("object"),
                ),
                ResponsiveTextContainer(
                  text: 'Stop Ads',
                  seticon: Icons.circle,
                  fun: () => print("object"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
