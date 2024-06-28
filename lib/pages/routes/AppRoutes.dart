import 'package:freeskills/pages/screens/home_screen.dart';
import 'package:freeskills/pages/screens/player_screen.dart';
import 'package:freeskills/pages/screens/profile_screen.dart';
import 'package:freeskills/pages/screens/search_screen.dart';
import 'package:freeskills/pages/screens/service_screens/auth_screens/signin_screen.dart';
import 'package:freeskills/pages/screens/service_screens/auth_screens/signup_screen.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/setupmain_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/player', page: () => const PlayerScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/search', page: () => const SearchScreen()),
        GetPage(name: '/signin', page: () => const SigninScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/setup', page: () => const SetupmainScreen()),
      ];
}
