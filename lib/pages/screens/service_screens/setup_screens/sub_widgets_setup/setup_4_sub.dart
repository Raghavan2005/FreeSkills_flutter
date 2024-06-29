import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colorstheme.dart';
import '../../../../../core/provider/SetupState_Provider.dart';
import '../../../../shared_widgets/setup_page_widgets/JobSelector_Widget.dart';

class SetupFour extends StatelessWidget {
  SetupFour({super.key});

  final ColorsTheme ct = ColorsTheme();

  @override
  Widget build(BuildContext context) {
    return Consumer<SetupstateProvider>(
      builder: (BuildContext context, langModel, Widget? child) {
        return SafeArea(
            child: Material(
          color: ct.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please Select Your Job",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: langModel.jonlist.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 5.0,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return JobSelector_Widget(
                          selectLevelprovider: langModel,
                          ss: 150,
                          slevel: langModel.selectedjob,
                          index: index,
                          name: langModel.jonlist[index],
                          fontsize: 12,
                          selectoer: 1,
                          hint: "her",
                        );
                      }),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
