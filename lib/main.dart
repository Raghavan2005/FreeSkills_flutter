import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/pages/screens/home_screen.dart';
import 'package:freeskills/pages/screens/player_screen.dart';
import 'package:freeskills/pages/screens/profile_screen.dart';
import 'package:freeskills/pages/screens/search_screen.dart';
import 'package:freeskills/pages/screens/service_screens/auth_screens/signin_screen.dart';
import 'package:freeskills/pages/screens/service_screens/auth_screens/signup_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ColorsTheme ct = new ColorsTheme();
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
            GetPage(name: '/signin', page: () => const SigninScreen()),
            GetPage(name: '/signup', page: () => const SignupScreen()),
          ],
          home: child,
        );
      },
      child: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const SignupScreen();
  }
}
