import 'package:FreeSkills/core/provider/MainState_Provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TechnewsWidget extends StatelessWidget {
  TechnewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainstateProvider>(
      builder: (BuildContext context, MainstateProvider value, Widget? child) {
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
                    fontSize: 19.sp),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                height: 0.15.sh,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(90, 90, 90, 190),
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
                  child: CarouselSlider.builder(
                    itemCount: value.newtemp.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.newtemp[itemIndex],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "Source:google.com",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w200),
                                ),
                                Spacer(),
                                Text(
                                  "Date:69/69/6969",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                        onPageChanged: (i, m) {
                          value.updatestatenews(i);
                        },
                        viewportFraction: 1,
                        autoPlay: true),
                  ),
                ),
              ),
              Center(
                child: new DotsIndicator(
                  dotsCount: value.newtemp.length,
                  position: value.currentiindexnews,
                  decorator: DotsDecorator(
                    color: Color.fromRGBO(33, 33, 33, 100), // Inactive color
                    activeColor: Colors.white60,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
