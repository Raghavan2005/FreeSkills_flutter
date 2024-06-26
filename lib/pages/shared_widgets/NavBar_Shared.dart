// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar_Shared extends StatelessWidget {
  const NavBar_Shared({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
        rippleColor: Colors.black,
        // tab button ripple color when pressed
        hoverColor: Colors.grey,
        // tab button hover color
        haptic: true,
        // haptic feedback
        tabBorderRadius: 50,
        tabActiveBorder: Border.all(color: Colors.black, width: 1),
        // tab button border
        tabBorder: Border.all(color: Colors.black, width: 1),
        // tab button border
        tabShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 0)
        ],
        // tab button shadow
        curve: Curves.easeOutExpo,
        backgroundColor: Colors.black,
        // tab animation curves
        duration: const Duration(milliseconds: 300),
        // tab animation duration
        gap: 8,
        // the tab button gap between icon and text
        color: Colors.grey,
        // unselected icon color
        activeColor: Colors.greenAccent,
        // selected icon and text color

        iconSize: 28.sp,
        // tab button icon size
        tabBackgroundColor: Colors.purple.withOpacity(0.1),
        // selected tab background color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        // navigation bar padding
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.hail,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.face_2_outlined,
            text: 'Search',
          ),
          GButton(
            icon: Icons.verified_user,
            text: 'Profile',
          )
        ]);
  }
}
