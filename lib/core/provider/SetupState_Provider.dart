import 'package:flutter/cupertino.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_3_sub.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_4_sub.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_5_sub.dart';

import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/completed_6_sub.dart';
import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_1_sub.dart';
import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_2_sub.dart';

class SetupstateProvider extends ChangeNotifier {
  List langlist = ['English', 'Tamil', 'Hindi'];
  int currentstate = 0;
  int selectedlevel = 0;
  int selectedlang = 0;
  bool usercopyright = false;
  int currentpage = 0;
  int totalpage = 0;

  List<Widget> setuplistpages = [
    SetupOne(),
    SetupTwo(),
    SetupThree(),
    SetupFour(),
    SetupFive(),
    CompletedSixSub()
  ];

  void nextpage() {
    if (currentstate != 5) {
      currentstate++;
    }
    notifyListeners();
  }

  void backpage() {
    if (currentstate != 0) {
      currentstate--;
    }
    notifyListeners();
  }

  void updateselectlevel(int value) {
    if (value >= 0 && value <= 2) {
      selectedlevel = value;
    }
    notifyListeners();
  }

  void updateselectlang(int value) {
    selectedlang = value;

    notifyListeners();
  }

  void updatecopyright(bool value) {
    usercopyright = value;
    notifyListeners();
  }

  void updatecopyrightpage(int value, int total) {
    totalpage = total;
    currentpage = value;
    notifyListeners();
  }
}
