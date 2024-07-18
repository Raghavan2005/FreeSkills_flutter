import 'package:FreeSkills/pages/routes/RoutesNames.dart';
import 'package:FreeSkills/pages/screens/home_screen.dart';
import 'package:FreeSkills/pages/screens/service_screens/ChatPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../screens/player_screen.dart';
import '../screens/service_screens/auth_screens/email_verfiy_screen.dart';
import '../screens/service_screens/auth_screens/signin_screen.dart';
import '../screens/service_screens/auth_screens/signup_screen.dart';
import '../screens/service_screens/setup_screens/setupmain_screen.dart';
import '../screens/sub_screen/about_screen.dart';
import '../screens/sub_screen/allhistory.dart';
import '../screens/sub_screen/notification_screen.dart';
import '../screens/sub_screen/premium.dart';
import '../screens/sub_screen/saved_screen.dart';
import '../screens/sub_screen/setting_screen.dart';
import '../screens/sub_screen/userdata_edit.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        //  builder: (context, state) => const HomeScreen(),
        builder: (context, state) => _userRedirect(context),
      ),
      GoRoute(
        path: Routesnames.SignInScreen,
        builder: (context, state) => SigninScreen(),
      ),
      GoRoute(
        path: Routesnames.HomeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: Routesnames.SignUpScreen,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: Routesnames.SetupScreen,
        builder: (context, state) => const SetupmainScreen(),
      ),
      GoRoute(
        path: Routesnames.Player_Screen,
        builder: (context, state) => const PlayerScreen(),
      ),
      GoRoute(
        path: Routesnames.AllhistoryScreen,
        builder: (context, state) => const Allhistory(),
      ),
      GoRoute(
        path: Routesnames.EmailScreen,
        builder: (context, state) => const EmailVerifyScreen(),
      ),
      GoRoute(
        path: Routesnames.SettingsScreen,
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
        path: Routesnames.AboutScreen,
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
        path: Routesnames.NotificationScreen,
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
      GoRoute(
        path: Routesnames.PremiumScreen,
        builder: (context, state) => const Premium(),
      ),
      GoRoute(
        path: Routesnames.ChatScreen,
        builder: (context, state) => const ChatPage(),
      ),
      GoRoute(
        path: Routesnames.UserdataEditScreen,
        builder: (context, state) => UserdataEdit(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: UserdataEdit(),
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
      GoRoute(
        path: Routesnames.SavedScreen,
        builder: (context, state) => SavedScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SavedScreen(),
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

  static Widget _userRedirect(BuildContext c) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return SignupScreen();
    } else {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        return HomeScreen();
      } else {
        return EmailVerifyScreen();
      }
    }
  }
}
