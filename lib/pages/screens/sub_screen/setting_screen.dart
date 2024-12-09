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

import 'package:FreeSkills/pages/routes/RoutesNames.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/SeetingsState_Provider.dart';
import '../../shared_widgets/profile_widgets/Custom_Settings_item_btn.dart';
import '../../shared_widgets/profile_widgets/Unstyle_Settings_btn.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SeetingsstateProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            foregroundColor: Colors.white,
            centerTitle: true,
            toolbarHeight: 100.0,
            backgroundColor: Colors.black87,
            title: Text(
              "settings",
              style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ).tr(),
          ),
          body: Column(
            children: [
              Custom_Settings_item_btn(
                titlename: 'app_language',
                endwidget: DropdownButton(
                  underline: Container(),
                  // Initial Value
                  value: value.AppUIlang,
                  dropdownColor: Colors.black,
                  elevation: 10,
                  // Down Arrow Icon
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),

                  // Array list of items
                  items: value.ListAppLang.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          items,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    value.updateAppUILang(newValue!,context);
                  },
                ),
              ),
              Custom_Settings_item_btn(
                titlename: 'autoplay',
                endwidget: SizedBox(
                  child: Switch.adaptive(
                    activeColor: Colors.purpleAccent,
                    activeTrackColor: Colors.purple,
                    inactiveThumbColor: Colors.grey,
                    value: value.autoplay,
                    onChanged: (bool v) {
                      value.updateautoplay();
                    },
                  ),
                ),
              ),
              Custom_Settings_item_btn(
                titlename: 'classic_view',
                endwidget: SizedBox(
                  child: Switch.adaptive(
                    activeColor: Colors.greenAccent,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.grey,
                    value: value.isoldrecom,
                    onChanged: (bool v) {
                      value.updateoldrecom();
                    },
                  ),
                ),
              ),
              Unstyle_Settings_btn(
                btntext: 'notification',
                onTap: () {},
              ),
              Unstyle_Settings_btn(
                btntext: 'manage_all_history',
                onTap: () {
                  context.push(Routesnames.AllhistoryScreen);
                },
              ),
              Unstyle_Settings_btn(
                btntext: 'purchase_premium',
                onTap: () {},
              ),
              Unstyle_Settings_btn(
                btntext: 'about',
                onTap: () {
                  context.push(Routesnames.AboutScreen);
                },
              ),
              Unstyle_Settings_btn(
                btntext: 'signout',
                onTap: () {
                  _showCustomPopup(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextStyle style =
            TextStyle(color: Colors.white, fontWeight: FontWeight.w900);
        return AlertDialog(
          backgroundColor: Colors.black87,
          title: Text(
            'Are you sure you want to log out?',
            style: style,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'This will erase all data from your device.',
                style: style,
              ),
              SizedBox(height: 20),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red)),
              child: Text(
                'signout',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ).tr(),
              onPressed: () async {
                final cm = Provider.of<SeetingsstateProvider>(context, listen: false);
                    cm.signout(context);
              },
            ),
          ],
        );
      },
    );
  }
}
