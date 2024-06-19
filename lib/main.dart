import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/pages/screens/home_screen.dart';
import 'package:freeskills/pages/screens/player_screen.dart';
import 'package:freeskills/pages/screens/profile_screen.dart';
import 'package:freeskills/pages/screens/search_screen.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/setupmain_screen.dart';
import 'package:get/get.dart';

import 'core/constants/colorstheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorsTheme ct = new ColorsTheme();
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Adjust to your design size
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => const home_screen()),
            GetPage(name: '/search', page: () => const search_screen()),
            GetPage(name: '/player', page: () => const player_screen()),
            GetPage(name: '/profile', page: () => const profile_screen()),
          ],
          home: child,
        );
      },
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const SetupmainScreen();
  }
}
