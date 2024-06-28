import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/provider/SetupState_Provider.dart';
import 'package:freeskills/pages/routes/RoutesNames.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'core/provider/MainState_Provider.dart';
import 'pages/routes/AppRoutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
            ),
            ChangeNotifierProvider<MainstateProvider>(
              create: (c) => MainstateProvider(),
            )
          ],
          child: GetMaterialApp(
            initialRoute: Routesnames.Homes,
            getPages: AppRoutes.appRoutes(),
            theme: ThemeData(
                fontFamily: "Inter",
                scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30, 1.0)),
          ),
        );
      },
    );
  }
}
