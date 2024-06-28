import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnewsWidget extends StatelessWidget {
  const TechnewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tech News",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 17.sp),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.infinity,
            height: 0.12.sh,
            child: Container(
                decoration: BoxDecoration(
              color: const Color.fromRGBO(90, 90, 90, 100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 3, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Shadow offset (x, y)
                ),
              ],
              borderRadius: BorderRadius.circular(25),
            )),
          ),
        ],
      ),
    );
  }
}
