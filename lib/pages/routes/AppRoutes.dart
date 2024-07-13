import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/player_screen.dart';
import '../screens/service_screens/auth_screens/signin_screen.dart';
import '../screens/service_screens/auth_screens/signup_screen.dart';
import '../screens/service_screens/setup_screens/setupmain_screen.dart';
import '../screens/sub_screen/about_screen.dart';
import '../screens/sub_screen/allhistory.dart';
import '../screens/sub_screen/notification_screen.dart';
import '../screens/sub_screen/setting_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/setup',
        builder: (context, state) => const SetupmainScreen(),
      ),
      GoRoute(
        path: '/player',
        builder: (context, state) => const PlayerScreen(),
      ),
      GoRoute(
        path: '/allhistory',
        builder: (context, state) => const Allhistory(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => SettingScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SettingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 190),
        ),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => AboutScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AboutScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 190),
        ),
      ),
      GoRoute(
        path: '/notification',
        builder: (context, state) => const NotificationScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: NotificationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 190),
        ),
      ),
    ],
  );
}
