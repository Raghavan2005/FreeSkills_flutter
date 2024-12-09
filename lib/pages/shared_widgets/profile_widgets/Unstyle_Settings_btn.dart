import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart'
    '';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Unstyle_Settings_btn extends StatelessWidget {
  const Unstyle_Settings_btn({
    super.key,
    required this.btntext,
    required this.onTap,
  });

  final String btntext;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white24,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 0.07.sh,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  btntext,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ).tr(),
              )
              ,
            ],
          ),
        ),
      ),
    );
  }
}
