import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Validator {
  static String? validatemail(TextEditingController tc) {
    // return GetUtils.isEmail(mailid);
    if (GetUtils.isEmail(tc.text.toLowerCase().trim())) {
      return null;
    } else {
      return "This doesn't look like a valid email.";
    }
  }

  static String? validatePassword(TextEditingController tc,
      [bool? tst, TextEditingController? tsmail]) {
    String password = tc.text.trim();

    if (tst != true) {
      if (password.isEmpty) {
        return "Password cannot be empty.";
      } else if (password.length < 8) {
        return "Password must be at least 8 characters long.";
      } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@#$%^&+=!]{8,}$')
          .hasMatch(password)) {
        return "Password must contain both letters and numbers.";
      } else {
        return null;
      }
    } else {
      if (password.isEmpty) {
        return "Password  be empty.";
      } else if (password.length < 8) {
        return "Invailed Password";
      } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@#$%^&+=!]{8,}$')
          .hasMatch(password)) {
        return "Invailed Password.";
      } else {
        //exxecte the login process here

        return null;
      }
    }
  }

  static String? isValidName(String name) {
    // Check if the name is empty or null
    if (name.isEmpty) {
      return "Empty Value";
    }

    // Define a regular expression for valid names (only alphabetic characters and spaces)
    final validNameRegExp = RegExp(r'^[a-zA-Z ]+$');

    // Check if the name matches the regular expression
    if (!validNameRegExp.hasMatch(name)) {
      return "Regular Expression are Not allowed";
    }

    // Check for a minimum and maximum length constraint (optional)
    const int minLength = 2;
    const int maxLength = 50;

    if (name.length < minLength || name.length > maxLength) {
      return "You Name Must Be Min 2 to Max of 50 Constraint";
    }

    return null;
  }
}
