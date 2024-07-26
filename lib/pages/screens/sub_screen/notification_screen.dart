/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +   Freeskills (Andorid&iso)                                                 +
 +   Copyright (c) 2024 Raghavan                                              +
 +   GitHub: https://github.com/raghavan2005                                  +
 +   All rights reserved..                                                    +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../core/provider/UserDataState_Provider.dart';
import '../../shared_widgets/home_widgets/Notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notvaluedata =
        Provider.of<UserdatastateProvider>(context, listen: false);
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
        body: ListView.builder(
          itemCount: notvaluedata.notlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Notification_item(
              itemtitle: notvaluedata.notlist[index]['title'],
              imageurl: notvaluedata.notlist[index]['imageurl'],
            );
          },
        ),
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
