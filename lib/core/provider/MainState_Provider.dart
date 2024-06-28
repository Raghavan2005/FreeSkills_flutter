import 'package:flutter/material.dart';
import 'package:freeskills/pages/screens/profile_screen.dart';
import 'package:freeskills/pages/screens/search_screen.dart';
import 'package:freeskills/pages/screens/shorts_screen.dart';

import '../../pages/screens/home_screen.dart';

class MainstateProvider extends ChangeNotifier {
  int currentnavtab = 0;
  List<Color> nav_select = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple
  ];
  List<Widget> screenlist = [
    const Home(),
    const ShortsScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];

  void updatenavstate(int index) {
    currentnavtab = index;
    notifyListeners();
  }
}
