import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/provider/SetupState_Provider.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/constants/colorstheme.dart';

class SetupmainScreen extends StatefulWidget {
  const SetupmainScreen({super.key});

  @override
  State<SetupmainScreen> createState() => _SetupmainScreenState();
}

class _SetupmainScreenState extends State<SetupmainScreen> {
  List<IconData> setupIcons = [
    Icons.supervised_user_circle,
    Icons.stacked_line_chart,
    Icons.language,
    Icons.local_post_office,
    Icons.copyright
  ];
  ColorsTheme ct = ColorsTheme();

  @override
  Widget build(BuildContext context) {
    return Consumer<SetupstateProvider>(
      builder: (BuildContext con, setupstateProvider, Widget? child) {
        setupstateProvider.updatebuildcontext(context);
        int selectedindex = setupstateProvider.currentstate;
        return SafeArea(
          child: ToastificationWrapper(
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
                                color: selectedindex <= i
                                    ? selectedindex >= i
                                        ? Colors.blue
                                        : Colors.grey
                                    : Colors.green,
                              );
                            },
                            connectorBuilder: (_, index, type) {
                              return SizedBox(
                                height: 40.0,
                                width: 0.05.sw,
                                child: (selectedindex <= index)
                                    ? (selectedindex >= index)
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
                  SizedBox(
                      width: double.infinity,
                      height: 0.75.sh,
                      child: setupstateProvider.setuplistpages[selectedindex]),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Visibility(
                      visible: selectedindex == 5 ? false : true,
                      child: Row(
                        children: [
                          Visibility(
                            visible: selectedindex > 0 ? true : false,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.lightGreen,
                                  side: const BorderSide(
                                      width: 2.0, color: Colors.lightGreen),
                                ),
                                onPressed: () {
                                  setupstateProvider.backpage();

                                  // print(selectedindex);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Back",
                                    style: TextStyle(
                                        color: Colors.lightGreen,
                                        fontSize: 22.sp),
                                  ),
                                )),
                          ),
                          Visibility(
                              visible: selectedindex > 0 ? true : false,
                              child: const Spacer()),
                          SizedBox(
                            width: selectedindex == 0 ? 340.w : 200.w,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.lightBlue,
                                  side: const BorderSide(
                                      width: 2.0, color: Colors.lightBlue),
                                ),
                                onPressed: () {
                                  setupstateProvider.nextpage();

                                  //  print(selectedindex);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    selectedindex == 4 ? "Submit" : "Next",
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 22.sp),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
