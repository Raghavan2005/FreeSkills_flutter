import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colorstheme.dart';
import '../../../../core/utils/Validator.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _ispass = true;

  final TextEditingController _mailidxon = TextEditingController();
  final TextEditingController _passcon = TextEditingController();
  final List _error = [null, null];

  @override
  Widget build(BuildContext context) {
    ColorsTheme ct = ColorsTheme();

    return SafeArea(
      child: Material(
        color: const Color.fromRGBO(30, 30, 30, 1.0),
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
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _mailidxon,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.green), // Normal border color
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Unselected border color
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Selected border color
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red), // Error border color
                                ),
                                hintText: " ",
                                labelText: "Mail ID",
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                errorText: _error[0],
                              ),
                              onSubmitted: (t) {
                                setState(() {
                                  _error[0] =
                                      Validator.validatemail(_mailidxon);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _passcon,
                              obscureText: _ispass,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.green), // Normal border color
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Unselected border color
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .green), // Selected border color
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red), // Error border color
                                ),
                                hintText: " ",
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    !_ispass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _ispass = !_ispass;
                                    });
                                  },
                                ),
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                errorText: _error[1],
                              ),
                              onSubmitted: (t) {
                                setState(() {
                                  _error[1] = Validator.validatePassword(
                                      _passcon, true, _mailidxon);
                                });
                              },
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: true
                                ? SizedBox(
                                    width: 50.sw,
                                    height: 0.08.sh,
                                    child: TextButton(
                                      style: ButtonStyle(
                                          overlayColor: WidgetStateProperty.all(
                                              const Color.fromRGBO(
                                                  0, 94, 25, 100)),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Colors.green)),
                                      onPressed: () {},
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                : Stack(children: [
                                    Container(
                                      width: 50.sw,
                                      height: 0.08.sh,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    Center(
                                        child: Container(
                                            margin: EdgeInsets.only(top: 12.h),
                                            child:
                                                const CircularProgressIndicator(
                                                    color: Colors.white)))
                                  ]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            //fdb
                          },
                          child: Text(
                            "Sign up now.",
                            style:
                                TextStyle(color: Colors.red, fontSize: 15.sp),
                          )),
                    ],
                  ),
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
                                      color: Colors.grey, fontSize: 18.sp),
                                )))
                      ],
                    ),
                  ),
                  const Spacer(),
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
