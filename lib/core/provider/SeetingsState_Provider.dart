import 'package:flutter/cupertino.dart';

class SeetingsstateProvider extends ChangeNotifier {
  List<String> ListAppLang = [
    'en-(English)',
    'ta-(Tamil)',
  ];
  bool autoplay = true;
  String AppUIlang = 'en-(English)';

  void updateAppUILang(String ui) {
    AppUIlang = ui;
    notifyListeners();
  }

  void updateautoplay() {
    autoplay = !autoplay;
    notifyListeners();
  }
}
