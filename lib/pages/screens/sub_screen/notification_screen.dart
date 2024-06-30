import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.decal,
          stops: [0.0, 0.70],
          colors: [
            Colors.white12,
            Colors.black12,
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black45,
          foregroundColor: Colors.white,
          title: Text(
            "Notification",
            style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Center(
          child: Text(
            "No Notification",
            style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
