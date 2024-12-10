import 'dart:convert';

import 'package:FreeSkills/core/provider/SetupState_Provider.dart';
import 'package:FreeSkills/core/utils/Appusage.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:workmanager/workmanager.dart';

//import 'package:youtube_shorts/youtube_shorts.dart';

import 'core/config/firebase_options.dart';
import 'core/provider/AuthState_Provider.dart';
import 'core/provider/MainState_Provider.dart';
import 'core/provider/PlayerState_Provider.dart';
import 'core/provider/SearchState_Provider.dart';
import 'core/provider/SeetingsState_Provider.dart';
import 'core/provider/ShortsState_Provider.dart';
import 'core/provider/UserDataState_Provider.dart';
import 'core/provider/VideoDataState_Provider.dart';
import 'core/services/NotificationService.dart';
import 'core/services/datasource/Data_Provider.dart';
import 'pages/routes/AppRoutes.dart';


bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

const notificationTask = "notificationTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == notificationTask) {
      await NotificationService().showNotificationBasedOnTime();
    }
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Initialize Firebase and Supabase
  await initAsync();

  // Run other async initialization tasks
  await runAppAsync();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (value) => runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ta', 'IN')],
        path: 'assets/translations',
        assetLoader: JsonAssetLoader(),
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );
}

Future<void> initAsync() async {
  // Initialize Firebase
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  if (shouldUseFirebaseEmulator) {
    await auth.useAuthEmulator('localhost', 9099);
  }

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://tbvsfzhfdziuqoghbatx.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRidnNmemhmZHppdXFvZ2hiYXR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyODU3OTksImV4cCI6MjAzNjg2MTc5OX0.pPhq3PFu8pOyznrXzZI-A-5O3oJML_wgajkUwQkfmzY',
  );
}

Future<void> runAppAsync() async {
  try {
    // Initialize Mobile Ads
    await MobileAds.instance.initialize();

    // Initialize Hive
    await Hive.initFlutter();
    await Hive.openBox("UserData");

    // Initialize Notifications
    await NotificationService().initializeNotifications();

    // Setup WorkManager
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    Workmanager().registerPeriodicTask(
      "1",
      notificationTask,
      frequency: const Duration(hours: 5),
    );

    // Start App Usage Monitoring
    Appusage au = Appusage();
    au.startserviceprogress(1);
  } catch (e) {
    debugPrint('Error in runAppAsync: $e');
  }
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
            ChangeNotifierProvider(create: (_) => VideodatastateProvider()),
            ChangeNotifierProvider(
                create: (_) => DataProvider()..initializeUserData()),

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
