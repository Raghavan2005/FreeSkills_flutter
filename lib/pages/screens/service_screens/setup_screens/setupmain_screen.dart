import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines/timelines.dart';

import '../../../../core/constants/colorstheme.dart';

class SetupmainScreen extends StatefulWidget {
  const SetupmainScreen({super.key});

  @override
  State<SetupmainScreen> createState() => _SetupmainScreenState();
}

class _SetupmainScreenState extends State<SetupmainScreen> {
  int _Selected = 3;
  List<IconData> setupIcons = [
    Icons.supervised_user_circle,
    Icons.stacked_line_chart,
    Icons.language,
    Icons.local_post_office,
    Icons.copyright
  ];
  @override
  Widget build(BuildContext context) {
    ColorsTheme ct = new ColorsTheme();
    return SafeArea(
      child: Material(
          color: ct.backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: FixedTimeline.tileBuilder(
                    theme: TimelineThemeData(
                      direction: Axis.horizontal,
                      nodePosition: 0.50,
                    ),
                    builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        indicatorBuilder: (c, i) {
                          return Icon(
                            setupIcons[i],
                            size: 35.sp,
                            color: _Selected <= i
                                ? _Selected >= i
                                    ? Colors.blue
                                    : Colors.grey
                                : Colors.green,
                          );
                        },
                        connectorBuilder: (_, index, type) {
                          return SizedBox(
                            height: 40.0,
                            width: 0.05.sw,
                            child: (_Selected <= index)
                                ? (_Selected >= index)
                                    ? DashedLineConnector(
                                        thickness: 3.h,
                                        dash: 5,
                                        color: Colors.lightGreen,
                                      )
                                    : DashedLineConnector(
                                        thickness: 3.h,
                                        dash: 5,
                                        color: Colors.grey,
                                      )
                                : SolidLineConnector(
                                    thickness: 3.h,
                                    color: Colors.greenAccent,
                                  ),
                          );
                        },
                        itemCount: setupIcons.length)),
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 0.8.sh,
              )
            ],
          )),
    );
  }
}
