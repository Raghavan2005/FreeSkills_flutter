import 'package:flutter/cupertino.dart';

class SeetingsstateProvider extends ChangeNotifier {
  List<String> ListAppLang = [
    'en-(English)',
    'ta-(Tamil)',
  ];
  bool autoplay = true;
  String AppUIlang = 'en-(English)';
  bool isoldrecom = false;

  void updateAppUILang(String ui) {
    AppUIlang = ui;
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
}
