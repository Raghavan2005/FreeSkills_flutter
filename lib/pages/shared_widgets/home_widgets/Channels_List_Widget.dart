import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/MainState_Provider.dart';
import 'Palette_Widget.dart';

class ChannelsListWidget extends StatelessWidget {
  const ChannelsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.23.sh,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "featured_channels",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 19.sp),
            ).tr(),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Consumer<MainstateProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    padding: EdgeInsets.all(1),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PaletterGen(
                          imageUrl: value.channeltempurl[index],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
