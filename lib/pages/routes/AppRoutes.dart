import 'package:freeskills/pages/screens/home_screen.dart';
import 'package:freeskills/pages/screens/service_screens/auth_screens/signin_screen.dart';
import 'package:freeskills/pages/screens/service_screens/auth_screens/signup_screen.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/setupmain_screen.dart';
import 'package:freeskills/pages/screens/sub_screen/notification_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/signin', page: () => const SigninScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/setup', page: () => const SetupmainScreen()),
        GetPage(
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 190),
            name: '/notification',
            page: () => const NotificationScreen()),
      ];
}
