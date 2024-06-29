// ignore_for_file: curly_braces_in_flow_control_structures, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/provider/SetupState_Provider.dart';

class LevelSelector_Widget extends StatelessWidget {
  const LevelSelector_Widget({
    super.key,
    required this.selectLevelprovider,
    required this.ss,
    required this.slevel,
    required this.index,
    required this.name,
    required this.fontsize,
    required this.selectoer,
  });

  final SetupstateProvider selectLevelprovider;
  final int ss;
  final int slevel;
  final int index, fontsize;
  final String name;
  final int selectoer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (selectoer == 0)
          selectLevelprovider.updateselectlevel(index);
        else
          selectLevelprovider.updateselectlang(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: ss.w,
          height: ss.h,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: slevel == index ? Colors.black54 : Colors.transparent,
                border: Border.all(
                    width: slevel == index ? 3 : 2,
                    color: slevel == index ? Colors.blue : Colors.green)),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontsize.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
