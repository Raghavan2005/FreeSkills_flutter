import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/pages/shared_widgets/player_widgets/textdisplay_widget.dart';

class YtdisplayerWidget extends StatelessWidget {
  const YtdisplayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.35.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: double.infinity,
                height: 0.25.sh,
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black38),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "69:69",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
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
          const Row(
            children: [
              TextdisplayWidget(
                text: "Freecodecamp",
                iconData: Icons.chair,
              ),
              TextdisplayWidget(
                text: "Tamil",
                iconData: Icons.chair,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
