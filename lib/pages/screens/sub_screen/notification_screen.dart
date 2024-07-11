import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../shared_widgets/home_widgets/Notification_item.dart';

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
          foregroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 100.0,
          backgroundColor: Colors.black87,
          title: Text(
            "Notification",
            style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
        ),
        body: Notification_item(),
      ),
    );
  }
}

/*
Center(
child: Text(
"No Notification",
style: TextStyle(
color: Colors.white,
fontSize: 19.sp,
fontWeight: FontWeight.w300),
),
)*/
