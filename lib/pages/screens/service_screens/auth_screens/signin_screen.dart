import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// Adjust the import as needed
import '../../../../core/constants/colorstheme.dart';
import '../../../../core/provider/AuthState_Provider.dart';
import '../../../routes/RoutesNames.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  bool isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    ColorsTheme ct = ColorsTheme();
    var authProvider = Provider.of<AuthStateLoginProvider>(context);

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
      body: SingleChildScrollView(
        physics: isKeyboardOpen ? null : NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              SizedBox(
                height: 0.1.sh,
              ),
              Container(
                width: double.infinity,
                height: 0.47.sh,
                decoration: BoxDecoration(
                    color: CupertinoColors.darkBackgroundGray,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.06.sh,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: authProvider.mailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintText: " ",
                          labelText: "Mail ID",
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          errorText: authProvider.error[0],
                        ),
                        onSubmitted: (t) {
                          authProvider.validateEmail();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: authProvider.passController,
                        obscureText: authProvider.isPass,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintText: " ",
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              !authProvider.isPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              authProvider.togglePasswordVisibility();
                            },
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          errorText: authProvider.error[1],
                        ),
                        onSubmitted: (t) {
                          authProvider.validatePassword();
                        },
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: !authProvider.isLoading
                          ? SizedBox(
                              width: 0.6.sw,
                              height: 0.06.sh,
                              child: TextButton(
                                style: ButtonStyle(
                                    overlayColor: WidgetStateProperty.all(
                                        const Color.fromRGBO(0, 94, 25, 100)),
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.green)),
                                onPressed: !authProvider.isLoading
                                    ? () {
                                        authProvider.auththeuser(context);
                                      }
                                    : null,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                              ),
                            )
                          : Stack(children: [
                              Container(
                                width: 50.sw,
                                height: 0.08.sh,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              Center(
                                  child: Container(
                                      margin: EdgeInsets.only(top: 12.h),
                                      child: const CircularProgressIndicator(
                                          color: Colors.white)))
                            ]),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                  TextButton(
                      style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                      onPressed: () {
                        context.push(Routesnames.SignUpScreen);
                      },
                      child: Text(
                        "Sign up now.",
                        style: TextStyle(color: Colors.red, fontSize: 15.sp),
                      )),
                ],
              ),
              SizedBox(
                height: 0.05.sh,
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
              SizedBox(
                height: 0.1.sh,
              ),
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
    );
  }
}
