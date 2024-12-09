import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Custom_Settings_item_btn extends StatelessWidget {
  const Custom_Settings_item_btn({
    super.key,
    required this.titlename,
    required this.endwidget,
  });

  final String titlename;
  final Widget endwidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white24,
      onTap: () {},
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                titlename,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ).tr(),
              Spacer(),
              endwidget,
            ],
          ),
        ),
      ),
    );
  }
}
