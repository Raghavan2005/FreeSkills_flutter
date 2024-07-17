import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../../core/provider/AuthState_Provider.dart';
import '../../../routes/RoutesNames.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  bool isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.decal,
        stops: [0.0, 2],
        colors: [
          Colors.white24,
          Colors.black12,
        ],
      ),
      body: Consumer<AuthstateCreateProvider>(builder: (context, authState, _) {
        return SingleChildScrollView(
          physics: isKeyboardOpen ? null : NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    //width: double.infinity,
                    height: 0.55.sh,
                    decoration: BoxDecoration(
                      color: CupertinoColors.darkBackgroundGray,
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              expands: false,
                              enabled: authState.isLogin,
                              controller: authState.mailController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                labelText: "Mail ID",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorText: authState.errorMessages[0],
                              ),
                              onSubmitted: (t) {
                                authState.validateMail();
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              expands: false,
                              enabled: authState.isLogin,
                              controller: authState.passwordController,
                              obscureText: authState.isPasswordObscured,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    authState.isPasswordObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    authState.togglePasswordVisibility();
                                  },
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorText: authState.errorMessages[1],
                              ),
                              onSubmitted: (t) {
                                authState.validatePassword();
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              expands: false,
                              enabled: authState.isLogin,
                              controller: authState.rePasswordController,
                              obscureText: authState.isRePasswordObscured,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    authState.isRePasswordObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    authState.toggleRePasswordVisibility();
                                  },
                                ),
                                labelText: "Re-Password",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorText: authState.errorMessages[2],
                              ),
                              onSubmitted: (t) {
                                authState.validateRePassword();
                              },
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: !authState.isLoading
                                ? SizedBox(
                                    width: 0.6.sw,
                                    height: 0.06.sh,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        splashFactory: NoSplash.splashFactory,
                                      ),
                                      onPressed: !authState.isLoading
                                          ? () async {
                                              await authState.register(context);
                                            }
                                          : null,
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      Container(
                                        width: 50.sw,
                                        height: 0.08.sh,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Already have an Account ?",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(Routesnames.SignInScreen);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.red, fontSize: 15.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.04.sh),
                Stack(
                  children: [
                    Divider(
                      color: Colors.white,
                    ),
                    Center(
                      child: Container(
                        color: Colors.grey[800],
                        child: Text(
                          "or signup with",
                          style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.06.sh),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: Text(
                    "Google",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
