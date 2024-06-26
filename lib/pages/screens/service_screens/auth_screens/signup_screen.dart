import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/utils/Validator.dart';

import '../../../../core/constants/colorstheme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _ispass1 = true;
  bool _ispass2 = true;
  ColorsTheme ct = ColorsTheme();
  List error = [null, null, null];
  bool islogin = true;

  final TextEditingController _mailidtxt = TextEditingController();
  final TextEditingController _passwordtxt = TextEditingController();
  final TextEditingController _repasstxt = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _mailidtxt.dispose();
    _passwordtxt.dispose();
    _repasstxt.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 0.61.sh,
                    decoration: BoxDecoration(
                        color: CupertinoColors.darkBackgroundGray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Text(
                              "Sign Up",
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
                              expands: false,
                              enabled: islogin,
                              controller: _mailidtxt,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
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
                                labelText: "Mail ID",
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                errorText: error[0],
                              ),
                              onSubmitted: (t) {
                                setState(() {
                                  error[0] = Validator.validatemail(_mailidtxt);
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
                              expands: false,
                              enabled: islogin,
                              controller: _passwordtxt,
                              obscureText: _ispass1,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    !_ispass1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _ispass1 = !_ispass1;
                                    });
                                  },
                                ),
                                labelText: "Password",
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                errorText: error[1],
                              ),
                              onSubmitted: (t) {
                                setState(() {
                                  error[1] =
                                      Validator.validatePassword(_passwordtxt);
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
                              expands: false,
                              enabled: islogin,
                              controller: _repasstxt,
                              obscureText: _ispass2,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    !_ispass2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _ispass2 = !_ispass2;
                                    });
                                  },
                                ),
                                labelText: "Re-Password",
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                errorText: error[2],
                              ),
                              onSubmitted: (t) {
                                setState(() {
                                  if (_passwordtxt.text.toString() ==
                                      _repasstxt.text.toString()) {
                                    error[2] = null;
                                    error[2] =
                                        Validator.validatePassword(_repasstxt);
                                  } else {
                                    error[2] = "Passwords do not match";
                                  }
                                });
                              }, // validator: (value) => value.isEmpty ? 'Username cannot be empty' : null,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: islogin
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
                                      onPressed: () {
                                        setState(() {
                                          islogin = false;
                                        });
                                      },
                                      child: Text(
                                        "Register",
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
                        "Already have a Account ?",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            //dfg
                          },
                          child: Text(
                            "Login",
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
                    padding: EdgeInsets.only(bottom: 40.h),
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
