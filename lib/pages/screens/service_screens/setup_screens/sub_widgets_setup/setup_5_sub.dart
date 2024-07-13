import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colorstheme.dart';
import '../../../../../core/provider/SetupState_Provider.dart';

class SetupFive extends StatelessWidget {
  SetupFive({super.key});

  final ColorsTheme ct = ColorsTheme();

  @override
  Widget build(BuildContext context) {
    final cm = Provider.of<SetupstateProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cm.displaythemsg("Information", "Scroll Down To Last Page", 3, context);
    });
    return Consumer<SetupstateProvider>(
      builder: (BuildContext context, copyModel, Widget? child) {
        return SafeArea(
            child: Material(
          color: ct.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Copyright Agreement",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: PDF(
                        nightMode: true,
                        onPageChanged: (int? current, int? total) {
                          print(current.toString());
                          copyModel.updatecopyrightpage(current! + 1, total!);
                        }).cachedFromUrl(
                      'https://drive.google.com/u/0/uc?id=1ffuPWQ_b0Cz3v_50BP40RN0m4HHNtBdz&export=download',
                      placeholder: (progress) => Center(
                          child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(),
                          ),
                          const Spacer(),
                          Text('Downlaoding From Our Server',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19.sp)),
                          Text('$progress%',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19.sp)),
                        ],
                      )),
                      errorWidget: (error) => Center(
                          child: Text(error.toString(),
                              style: const TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
                SizedBox(
                    height: 0.05.sh,
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          value: copyModel.usercopyright,
                          onChanged:
                              (copyModel.currentpage == copyModel.totalpage)
                                  ? (bool? value) {
                                      copyModel.updatecopyright(value!);
                                    }
                                  : null,
                        ),
                        Text(
                          maxLines: 3,
                          "By clicking Accept or using the App,\nyou acknowledge that you have read, understood,\nand agree to be bound by the terms and conditions of this Agreement.",
                          style: TextStyle(
                              fontSize: 8.5.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
      },
    );
  }
}
