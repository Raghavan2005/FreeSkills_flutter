import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/RoutesNames.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

bool isEmailVerified = false;
Timer? timer;

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      // TODO: implement your code after email verification
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email Successfully Verified")));
      timer?.cancel();
      context.go(Routesnames.SetupScreen);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.push(Routesnames.SignUpScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                      size: 40.sp,
                    )),
              ),
            ),
            Icon(
              Icons.email,
              color: Colors.white,
              size: 80.sp,
            ),
            SizedBox(height: 20.h),
            Text(
              "Verify Your Email",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Please verify your email address to continue.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Please open your mail application, click the verification link, and complete the process.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 30.h),
            CircularProgressIndicator(
              color: Colors.blueAccent,
              strokeWidth: 6,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
