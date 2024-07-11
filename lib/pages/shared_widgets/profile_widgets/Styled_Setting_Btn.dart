import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styled_Setting_Btn extends StatelessWidget {
  const Styled_Setting_Btn({
    super.key,
    required this.onTap,
    required this.btntext,
    required this.icondata,
  });

  final String btntext;
  final VoidCallback onTap;
  final IconData icondata;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white24,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 0.05.sh,
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Icon(
                icondata,
                color: Colors.white,
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(
                btntext,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
