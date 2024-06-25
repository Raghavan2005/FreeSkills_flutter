import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/provider/SetupState_Provider.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/setupmain_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<SetupstateProvider>(
              create: (c) => SetupstateProvider(),
            )
          ],
          child: GetMaterialApp(
            home: child,
            theme: ThemeData(
                scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30, 1.0)),
          ),
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
