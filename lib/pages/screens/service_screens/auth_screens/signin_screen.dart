import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colorstheme.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    ColorsTheme ct = new ColorsTheme();
    int scw = MediaQuery.of(context).size.width.round();
    int sch = MediaQuery.of(context).size.height.round();
    return SafeArea(
      child: Material(
        color: ct.backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 0.55.sh,
                    decoration: BoxDecoration(
                        color: CupertinoColors.darkBackgroundGray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 80.h),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.green), // Normal border color
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Unselected border color
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Selected border color
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red), // Error border color
                                ),
                                hintText: "Mail ID",
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.red),
                                errorText: null,
                              ),
                              // Example validation
                              // validator: (value) => value.isEmpty ? 'Username cannot be empty' : null,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.green), // Normal border color
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Unselected border color
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Selected border color
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red), // Error border color
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.red),
                                errorText: null,
                              ),
                              // Example validation
                              // validator: (value) => value.isEmpty ? 'Username cannot be empty' : null,
                            ),
                          ),
                          Spacer(),
                          Container(
                            child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 50.w),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20.sp, color: Colors.white),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      child: Row(
                    children: [
                      Text(
                        "Already have a Account ?",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style:
                                TextStyle(color: Colors.red, fontSize: 15.sp),
                          )),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Stack(
                      children: [
                        const Divider(
                          color: Colors.white,
                        ),
                        Center(
                            child: Container(
                                color: ct.backgroundColor,
                                child: Text(
                                  "or signup with",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: scw / 40 * 2),
                                )))
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50.h),
                    child: Text(
                      "Google",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          backgroundColor: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
