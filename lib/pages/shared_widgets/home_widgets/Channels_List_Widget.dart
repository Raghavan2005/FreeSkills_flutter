import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelsListWidget extends StatelessWidget {
  const ChannelsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.16.sh,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Channels",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: EdgeInsets.all(1),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 62.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(90, 90, 90, 100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              // Shadow color
                              spreadRadius: 3,
                              // Spread radius
                              blurRadius: 5,
                              // Blur radius
                              offset: Offset(0, 3), // Shadow offset (x, y)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
