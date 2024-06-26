import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/pages/shared_widgets/StatesSelecter.dart';

import '../../../../../core/constants/colorstheme.dart';

class SetupTwo extends StatelessWidget {
  SetupTwo({super.key});

  final ColorsTheme ct = ColorsTheme();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      color: ct.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please Enter Your Current States",
              style: TextStyle(color: Colors.white, fontSize: 38.sp),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: 0.3.sh,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            const LevelSelector()
          ],
        ),
      ),
    ));
  }
}
