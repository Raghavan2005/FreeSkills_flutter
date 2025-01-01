import 'package:FreeSkills/pages/screens/aichat_screen.dart';
import 'package:FreeSkills/pages/screens/profile_screen.dart';
import 'package:FreeSkills/pages/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../pages/screens/home_screen.dart';

class MainstateProvider extends ChangeNotifier {
  int currentnavtab = 0;
  int currentiindexnews = 0;
  final PageController pageController = PageController(keepPage: true);

  List<Color> nav_select = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple
  ];


  void reset(){
    currentiindexnews=0;
    currentnavtab=0;
    notifyListeners();
  }
  List<Widget> screenlist = [
    const Home(),
    // const ShortsScreen(),
    const AichatScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];

  List<String> channeltempurl = [
    "https://img.youtube.com/vi/zN8YNNHcaZc/maxresdefault.jpg",
    "https://img.youtube.com/vi/zN8YNNHcaZc/maxresdefault.jpg",
    "https://img.youtube.com/vi/zN8YNNHcaZc/maxresdefault.jpg","https://img.youtube.com/vi/zN8YNNHcaZc/maxresdefault.jpg"];

  void updatenavstate(int index) {
    currentnavtab = index;
    pageController.animateToPage(
      currentnavtab,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }


  void updatestatenews(int i) {
    currentiindexnews = i;
    notifyListeners();
  }
}
