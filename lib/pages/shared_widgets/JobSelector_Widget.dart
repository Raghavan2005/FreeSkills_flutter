import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/provider/SetupState_Provider.dart';

class JobSelector_Widget extends StatelessWidget {
  const JobSelector_Widget({
    super.key,
    required this.selectLevelprovider,
    required this.ss,
    required this.slevel,
    required this.index,
    required this.name,
    required this.fontsize,
    required this.selectoer,
    required this.hint,
  });

  final SetupstateProvider selectLevelprovider;
  final int ss;
  final int slevel;
  final int index, fontsize;
  final String name, hint;
  final int selectoer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectLevelprovider.updatejob(index);
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
                    width: 2,
                    color: slevel == index ? Colors.blue : Colors.green)),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Stack(alignment: AlignmentDirectional.topEnd, children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      color: Colors.green,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        name,
                        style: TextStyle(
                            color: Colors.white, fontSize: fontsize.sp),
                      ),
                    ),
                  ],
                ),
                Tooltip(
                  message: hint,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.info_outline,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
