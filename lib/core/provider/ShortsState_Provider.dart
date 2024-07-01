import 'package:flutter/cupertino.dart';

class ShortsstateProvider extends ChangeNotifier {
  List listofvidos = [
    "4Oiv3H1DEpI",
    "sVZ7BEUefYM",
    "ieDm2NOR62k",
    "-MCbYcVpjd0"
  ];
  int currentpage = 0;

  void updatepage(int i) {
    currentpage = i;
    notifyListeners();
  }
}
