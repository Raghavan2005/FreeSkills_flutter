import 'package:flutter/cupertino.dart';

class SeetingsstateProvider extends ChangeNotifier {
  List<String> ListAppLang = ['en-(English)', 'ta-(Tamil)'];
  String AppUIlang = 'en-(English)';

  void updateAppUILang(String ui) {
    AppUIlang = ui;
    notifyListeners();
  }
}
