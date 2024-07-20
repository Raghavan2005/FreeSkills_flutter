import 'package:FreeSkills/core/provider/SetupState_Provider.dart';
import 'package:FreeSkills/core/utils/Appusage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//import 'package:youtube_shorts/youtube_shorts.dart';

import 'core/config/firebase_options.dart';
import 'core/provider/AuthState_Provider.dart';
import 'core/provider/MainState_Provider.dart';
import 'core/provider/PlayerState_Provider.dart';
import 'core/provider/SearchState_Provider.dart';
import 'core/provider/SeetingsState_Provider.dart';
import 'core/provider/ShortsState_Provider.dart';
import 'core/provider/UserDataState_Provider.dart';
import 'pages/routes/AppRoutes.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  if (shouldUseFirebaseEmulator) {
    await auth.useAuthEmulator('localhost', 9099);
  }
  await Supabase.initialize(
    url: 'https://tbvsfzhfdziuqoghbatx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRidnNmemhmZHppdXFvZ2hiYXR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyODU3OTksImV4cCI6MjAzNjg2MTc5OX0.pPhq3PFu8pOyznrXzZI-A-5O3oJML_wgajkUwQkfmzY',
  );
  await Hive.openBox("UserData");
  // MediaKit.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('ta', 'IN')],
          path: 'assets/translations',
          assetLoader: JsonAssetLoader(),
          fallbackLocale: Locale('en', 'US'),
          child: MyApp())));
  Appusage au = Appusage();
  au.startserviceprogress(1);
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
            ChangeNotifierProvider<PlayerstateProvider>(
              create: (c) => PlayerstateProvider(),
            ),
            ChangeNotifierProvider(create: (_) => AuthStateLoginProvider()),
            ChangeNotifierProvider(create: (_) => AuthstateCreateProvider()),
            ChangeNotifierProvider(create: (_) => UserdatastateProvider()),
            /* ChangeNotifierProvider<MiniplayerstateProvider>(
              create: (c) => MiniplayerstateProvider(),
            ),*/
          ],
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            //initialRoute: Routesnames.Homes,
            routerConfig: AppRoutes.router,
            theme: ThemeData(
              fontFamily: "Inter",
            ),
          ),
        );
      },
    );
  }
}
