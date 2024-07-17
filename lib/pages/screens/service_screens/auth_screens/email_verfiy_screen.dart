import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              color: Colors.blue,
              strokeWidth: 2,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
