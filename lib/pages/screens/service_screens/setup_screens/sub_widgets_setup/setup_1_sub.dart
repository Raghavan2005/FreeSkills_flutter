import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FreeSkills/core/provider/SetupState_Provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colorstheme.dart';

class SetupOne extends StatelessWidget {
  SetupOne({super.key});

  final ColorsTheme ct = ColorsTheme();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      color: ct.backgroundColor,
      child: Consumer<SetupstateProvider>(
        builder:
            (BuildContext context, SetupstateProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please Enter Your Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w900),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 0.2.sh,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: value.usernameconller,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Normal border color
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Unselected border color
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Selected border color
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red), // Error border color
                      ),
                      hintText: " ",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      labelText: "Username",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      errorText: value.errorList[0],
                    ),
                    onSubmitted: (val) {
                      value.updatetheusername(val);
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    ));
  }
}
