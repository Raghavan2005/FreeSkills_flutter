import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchWidget extends StatelessWidget {
  const WatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Continue Watching",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 19.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(1),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    width: 0.6.sw,
                    height: 0.25.sh,
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
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
