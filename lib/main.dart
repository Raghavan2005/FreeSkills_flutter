import 'package:FreeSkills/core/provider/SetupState_Provider.dart';
import 'package:FreeSkills/pages/routes/RoutesNames.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

//import 'package:youtube_shorts/youtube_shorts.dart';

import 'core/provider/MainState_Provider.dart';
import 'core/provider/SearchState_Provider.dart';
import 'core/provider/SeetingsState_Provider.dart';
import 'core/provider/ShortsState_Provider.dart';
import 'pages/routes/AppRoutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // MediaKit.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('ta', 'IN')],
          path: 'assets/translations',
          assetLoader: JsonAssetLoader(),
          fallbackLocale: Locale('en', 'US'),
          child: MyApp())));
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
            ),
            ChangeNotifierProvider<MainstateProvider>(
              create: (c) => MainstateProvider(),
            ),
            ChangeNotifierProvider<ShortsstateProvider>(
              create: (c) => ShortsstateProvider(),
            ),
            ChangeNotifierProvider<SeetingsstateProvider>(
              create: (c) => SeetingsstateProvider(),
            ),
            ChangeNotifierProvider<SearchstateProvider>(
              create: (c) => SearchstateProvider(),
            ),
            /* ChangeNotifierProvider<MiniplayerstateProvider>(
              create: (c) => MiniplayerstateProvider(),
            ),*/
          ],
          child: GetMaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            initialRoute: Routesnames.Homes,
            getPages: AppRoutes.appRoutes(),
            theme: ThemeData(
              fontFamily: "Inter",
            ),
          ),
        );
      },
    );
  }
}
