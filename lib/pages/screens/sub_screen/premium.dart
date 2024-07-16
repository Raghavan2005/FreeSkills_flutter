/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +   Freeskills (Andorid&iso)                                                 +
 +   Copyright (c) 2024 Raghavan                                              +
 +   GitHub: https://github.com/raghavan2005                                  +
 +   All rights reserved..                                                    +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.decal,
          stops: [0.0, 0.50],
          colors: [
            Color.fromRGBO(67, 10, 93, 100),
            Color.fromRGBO(23, 21, 59, 100),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 0.05.sh,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: 30.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.10.sh,
            ),
            Text(
              "FreeSkills Premium",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 33.sp,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => {},
              splashColor: Colors.orange,
              child: Container(
                width: 0.9.sw,
                height: 0.4.sh,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 1.5),
                    color: Color.fromRGBO(67, 10, 93, 70),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "UPGRADE TO",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.orange)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "1 Month",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Premium",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w900),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.01.sh,
                            ),
                            Text(
                              "● Ad-Free",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "● Access to Premium content",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "● Express content request",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "● 24/7 Tech Support",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.1.sh,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 0.5.sw,
                height: 0.07.sh,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.purple)),
                    onPressed: () {},
                    child: Text(
                      "Get Premium",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
