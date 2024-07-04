import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../player_widgets/textdisplay_widget.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 0.9.sw,
        height: 0.34.sh,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                // Shadow color
                spreadRadius: 3,
                // Spread radius
                blurRadius: 5,
                // Blur radius
                offset: Offset(0, 3), // Shadow offset (x, y)
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              stops: [
                0.0,
                0.0,
                0.50,
              ],
              colors: [
                Colors.white12,
                Colors.black12,
                Colors.white12,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 0.9.sw,
                  height: 0.21.sh,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "TITLE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextdisplayWidget(
                      text: "Freecodecamp",
                      iconData: Icons.youtube_searched_for,
                    ),
                    TextdisplayWidget(
                      text: "Tamil",
                      iconData: Icons.youtube_searched_for,
                    ),
                    TextdisplayWidget(
                      text: "12.12.12",
                      iconData: Icons.youtube_searched_for,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
