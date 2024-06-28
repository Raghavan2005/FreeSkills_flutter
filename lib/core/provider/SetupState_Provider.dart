import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeskills/core/utils/Validator.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_3_sub.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_4_sub.dart';
import 'package:freeskills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_5_sub.dart';
import 'package:toastification/toastification.dart';

import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/completed_6_sub.dart';
import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_1_sub.dart';
import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_2_sub.dart';

class SetupstateProvider extends ChangeNotifier {
  List langlist = ['English', 'தமிழ்', 'Hindi'];
  List jonlist = [
    'Android Application Developer',
    'Web Developer',
    'AI-ML Developer',
  ];
  List errorList = [null, null, null, null, null];
  TextEditingController usernameconller = TextEditingController();
  String? username = null;
  int currentstate = 0;
  int selectedlevel = -1;
  int selectedlang = -1;
  int selectedjob = -1;
  bool usercopyright = false;
  int currentpage = 0;
  int totalpage = 0;
  bool butnanim = false;

  void updateanim() {
    butnanim = !butnanim;
    notifyListeners();
  }

  List<Widget> setuplistpages = [
    SetupOne(),
    SetupTwo(),
    SetupThree(),
    SetupFour(),
    SetupFive(),
    CompletedSixSub()
  ];

  void nextpage(BuildContext ofsetupscreen) {
    if (currentstate != 5) {
      updatethebutton(ofsetupscreen);
    }
  }

  void updatethebutton(BuildContext ofsetupscreen) {
    if (currentstate == 0 && errorList[0] == null) {
      if (username == null) {
        updatetherror("Empty Value", 0);
      } else {
        currentstate++;
      }
    } else if (currentstate == 1 &&
        errorList[1] == null &&
        selectedlevel != -1) {
      currentstate++;
    } else if (currentstate == 2 &&
        errorList[2] == null &&
        selectedlang != -1) {
      currentstate++;
    } else if (currentstate == 3 && errorList[3] == null && selectedjob != -1) {
      currentstate++;
    } else if (currentstate == 4 && errorList[4] == null && usercopyright) {
      currentstate++;
    } else {
      if (currentstate > 0) {
        if (currentstate != 4) {
          displaythemsg(
              "Information", "Please Select Below Options", 1, ofsetupscreen);
        } else {
          displaythemsg("User Copyright Agreement",
              "Please Click Accepts User Agreement", 1, ofsetupscreen);
        }
      }
    }

    notifyListeners();
  }

  void backpage() {
    if (currentstate >= 0) {
      currentstate--;
    }
    notifyListeners();
  }

  void updatetheusername(String name) {
    print(errorList);
    if (Validator.isValidName(name) == null) {
      username = name;
      usernameconller.text = username!;
      notifyListeners();
      updatetherror(null, 0);
    } else {
      updatetherror(Validator.isValidName(name).toString(), 0);
    }
  }

  void updatetherror(String? errormsg, int index) {
    errorList[index] = errormsg;
    notifyListeners();
  }

  void updateselectlevel(int value) {
    if (value >= 0 && value <= 2) {
      updatetherror(null, 1);
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

  void updatejob(int value) {
    selectedjob = value;
    notifyListeners();
  }

  void updatecopyrightpage(int value, int total) {
    totalpage = total;
    currentpage = value;
    notifyListeners();
  }

  void displaythemsg(
      String errortitle, String errordis, int time, BuildContext c) {
    toastification.show(
      style: ToastificationStyle.flatColored,
      backgroundColor: Colors.redAccent,
      primaryColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icon(
        Icons.error,
        color: Colors.white,
        size: 25.sp,
      ),
      pauseOnHover: true,
      context: c,
      description: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          errordis,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          errortitle,
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }
}
