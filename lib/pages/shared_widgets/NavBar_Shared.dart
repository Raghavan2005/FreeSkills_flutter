// ignore_for_file: camel_case_types, file_names

import 'package:FreeSkills/core/provider/MainState_Provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class NavBar_Shared extends StatelessWidget {
  const NavBar_Shared({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainstateProvider>(
      builder: (BuildContext context, mainStateProvider, Widget? child) {
        return GNav(
          rippleColor: Colors.black,
          // tab button ripple color when pressed
          hoverColor: Colors.grey,
          // tab button hover color
          haptic: true,
          // haptic feedback
          tabBorderRadius: 50,
          tabActiveBorder: Border.all(color: Colors.black, width: 2),
          // tab button border
          tabBorder: Border.all(color: Colors.black, width: 1),
          // tab button border
          tabShadow: const [BoxShadow(color: Colors.black, blurRadius: 1)],
          // tab button shadow
          curve: Curves.easeOutExpo,
          backgroundColor: Colors.black,
          // tab animation curves
          duration: const Duration(milliseconds: 150),
          // tab animation duration
          gap: 8,
          // the tab button gap between icon and text
          color: Colors.white60,
          // unselected icon color
          activeColor:
              mainStateProvider.nav_select[mainStateProvider.currentnavtab],
          // selected icon and text color

          iconSize: 25.sp,
          // tab button icon size
          tabBackgroundColor: mainStateProvider
              .nav_select[mainStateProvider.currentnavtab]
              .withOpacity(0.1),
          // selected tab background color
          padding: const EdgeInsets.all(15),
          // navigation bar padding
          tabs:  [
            GButton(
              icon: Icons.home,
              text: context.tr('home'),
            ),
            GButton(
              icon: Icons.graphic_eq,
              text: context.tr('ai_chat'),
            ),
            GButton(
              icon: Icons.search,
              text: context.tr('search'),
            ),
            GButton(
              icon: Icons.person,
              text: context.tr('profile'),
            )
          ],
          selectedIndex: mainStateProvider.currentnavtab,
          onTabChange: (index) {
            if (mainStateProvider.currentnavtab != index) {
              mainStateProvider.updatenavstate(index);
            }
          },
        );
      },
    );
  }
}
