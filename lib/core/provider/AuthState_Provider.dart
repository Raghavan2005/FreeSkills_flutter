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

import 'package:FreeSkills/core/services/auth/UserLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../utils/Validator.dart';

class AuthStateLoginProvider extends ChangeNotifier {
  bool _isPass = true;
  bool _isLoading = false;

  bool get isPass => _isPass;

  bool get isLoading => _isLoading;

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final List<String?> error = [null, null];

  void togglePasswordVisibility() {
    _isPass = !_isPass;
    notifyListeners();
  }

  void validateEmail() {
    error[0] = Validator.validatemail(mailController);
    notifyListeners();
  }

  void validatePassword() {
    error[1] = Validator.validatePassword(passController, true, mailController);
    notifyListeners();
  }

  void auththeuser(BuildContext c) async {
    validateEmail();
    validatePassword();

    if (error[0] == null && error[1] == null) {
      _isLoading = true;
      Userlogin userlogin = Userlogin();
      String info = await userlogin.getUserSignIn(
          mailController.text, passController.text);
      if (info.isNotEmpty) {
        displaythemsg("Login", info, 4, c);
        _isLoading = false;
      }
    }
    notifyListeners();
  }

  void displaythemsg(
      String errortitle, String errordis, int time, BuildContext c) {
    toastification.show(
      style: ToastificationStyle.flatColored,
      backgroundColor: Colors.redAccent,
      primaryColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icon(
        Icons.error,
        color: Colors.white,
        size: 25.sp,
      ),
      pauseOnHover: true,
      context: c,
      description: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          errordis,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          errortitle,
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }
}

class AuthstateCreateProvider extends ChangeNotifier {
  bool _isLogin = true;

  bool get isLogin => _isLogin;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  List<String?> _errorMessages = [null, null, null];

  List<String?> get errorMessages => _errorMessages;

  bool _isPasswordObscured = true;

  bool get isPasswordObscured => _isPasswordObscured;

  bool _isRePasswordObscured = true;

  bool get isRePasswordObscured => _isRePasswordObscured;

  void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }

  void toggleRePasswordVisibility() {
    _isRePasswordObscured = !_isRePasswordObscured;
    notifyListeners();
  }

  void validateMail() {
    _errorMessages[0] = Validator.validatemail(mailController);
    notifyListeners();
  }

  void validatePassword() {
    _errorMessages[1] = Validator.validatePassword(passwordController);
    notifyListeners();
  }

  void validateRePassword() {
    if (passwordController.text == rePasswordController.text) {
      _errorMessages[2] = null;
      _errorMessages[2] = Validator.validatePassword(rePasswordController);
    } else {
      _errorMessages[2] = "Passwords do not match";
    }
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    validateMail();
    validatePassword();
    validateRePassword();
    if (errorMessages[0] == null &&
        errorMessages[1] == null &&
        errorMessages[2] == null) {
      _isLoading = true;
      Userlogin userlogin = Userlogin();
      String info = await userlogin.createUserWithEmailAndPassword(
          mailController.text, rePasswordController.text);
      if (info.isNotEmpty) {
        displaythemsg("Account Created", info, 4, context);
        _isLoading = false;
        //redirect
      }
    }
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  void displaythemsg(
      String errortitle, String errordis, int time, BuildContext c) {
    toastification.show(
      style: ToastificationStyle.flatColored,
      backgroundColor: Colors.redAccent,
      primaryColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icon(
        Icons.error,
        color: Colors.white,
        size: 25.sp,
      ),
      pauseOnHover: true,
      context: c,
      description: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          errordis,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          errortitle,
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }
}
