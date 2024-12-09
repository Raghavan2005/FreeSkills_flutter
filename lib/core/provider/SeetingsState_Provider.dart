import 'package:FreeSkills/core/provider/MainState_Provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../pages/routes/RoutesNames.dart';

class SeetingsstateProvider extends ChangeNotifier {
  List<String> ListAppLang = [
    'en-(English)',
    'ta-(Tamil)',
  ];
  bool autoplay = true;
  String AppUIlang = 'en-(English)';
  bool isoldrecom = false;



  void updateAppUILang(String ui,BuildContext c) {
    AppUIlang = ui;
    if(ui.contains('en'))
    c.setLocale(Locale('en', 'US'));
    else
      c.setLocale(Locale('ta', 'IN'));
    notifyListeners();
  }

  void updateoldrecom() {
    isoldrecom = !isoldrecom;
    notifyListeners();
  }

  void updateautoplay() {
    autoplay = !autoplay;
    notifyListeners();
  }

  void signout(BuildContext c) async {
    await FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance.currentUser == null) {
      var box = await Hive.openBox('UserData');
      box.clear();

      Provider.of<MainstateProvider>(c, listen: false).reset();
      c.go(Routesnames.SignUpScreen);
    }
  }


}
