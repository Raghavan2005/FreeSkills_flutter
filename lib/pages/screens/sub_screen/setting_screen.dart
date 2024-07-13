import 'package:FreeSkills/pages/routes/RoutesNames.dart';
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
          backgroundColor: Colors.black87,
          appBar: AppBar(
            foregroundColor: Colors.white,
            centerTitle: true,
            toolbarHeight: 100.0,
            backgroundColor: Colors.black87,
            title: Text(
              "Settings",
              style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          body: Column(
            children: [
              Custom_Settings_item_btn(
                titlename: 'App Language',
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
                    value.updateAppUILang(newValue!);
                  },
                ),
              ),
              Custom_Settings_item_btn(
                titlename: 'Autoplay',
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
                titlename: 'Classic View',
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
                btntext: 'Notification',
                onTap: () {},
              ),
              Unstyle_Settings_btn(
                btntext: 'Manage all history',
                onTap: () {
                  context.push(Routesnames.AllhistoryScreen);
                },
              ),
              Unstyle_Settings_btn(
                btntext: 'Purchase Premium',
                onTap: () {},
              ),
              Unstyle_Settings_btn(
                btntext: 'About',
                onTap: () {
                  context.push(Routesnames.AboutScreen);
                },
              ),
              Unstyle_Settings_btn(
                btntext: 'Signout',
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
