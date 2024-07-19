import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routes/RoutesNames.dart';

class HistoryviewWidget extends StatelessWidget {
  final String titlename;

  const HistoryviewWidget({super.key, required this.titlename});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                titlename,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 19.sp),
              ),
              Spacer(),
              OutlinedButton(
                  onPressed: () {
                    context.push(Routesnames.AllhistoryScreen);
                  },
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  child: Text(
                    "View all",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(1),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.push(Routesnames.Player_Screen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 0.12.sh,
                          width: 0.5.sw,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            // Adjust the radius as needed
                            child: Image.network(
                              "https://img.youtube.com/vi/bIYnu3spU7o/maxresdefault.jpg",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SizedBox(
                            width: 0.4.sw,
                            child: RichText(
                              textAlign: TextAlign.start,
                              textWidthBasis: TextWidthBasis.parent,
                              text: TextSpan(
                                text:
                                    "Updated and added new Course On your Application",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  // You can customize the color and other text styles here
                                  fontSize:
                                      14.0, // Adjust the font size as needed
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
