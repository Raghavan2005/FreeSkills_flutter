import 'package:FreeSkills/core/provider/MainState_Provider.dart';
import 'package:FreeSkills/core/utils/Appusage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/UserDataState_Provider.dart';

class TechnewsWidget extends StatelessWidget {
  TechnewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final valuedata =
        Provider.of<UserdatastateProvider>(context, listen: false);
    return Consumer<MainstateProvider>(
      builder: (BuildContext context, MainstateProvider value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "title",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 19.sp),
              ).tr(),
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
                    itemCount: valuedata.newslist.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      String titlename =
                          valuedata.newslist[itemIndex]['newstitile'];
                      String sourcedata =
                          valuedata.newslist[itemIndex]['source'];
                      String date = valuedata.newslist[itemIndex]['date'];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titlename.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  "Source:$sourcedata",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w200),
                                ),
                                const Spacer(),
                                Text(
                                  "Date:$date",
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
                  dotsCount: valuedata.newslist.length,
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
