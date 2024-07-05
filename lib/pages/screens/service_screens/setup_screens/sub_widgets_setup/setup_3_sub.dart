import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FreeSkills/core/provider/SetupState_Provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colorstheme.dart';
import '../../../../shared_widgets/setup_page_widgets/LevelSelector_Widget.dart';

class SetupThree extends StatelessWidget {
  SetupThree({super.key});

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
                  "Please Select Your Language",
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
                      itemCount: langModel.langlist.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5.0,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return LevelSelector_Widget(
                          selectLevelprovider: langModel,
                          ss: 150,
                          slevel: langModel.selectedlang,
                          index: index,
                          name: langModel.langlist[index],
                          fontsize: 22,
                          selectoer: 1,
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
