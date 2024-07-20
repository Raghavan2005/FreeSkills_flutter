import 'package:FreeSkills/core/services/auth/UserDataPack.dart';
import 'package:FreeSkills/core/services/datasource/Image_Network_Provider.dart';
import 'package:FreeSkills/core/utils/Validator.dart';
import 'package:FreeSkills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_3_sub.dart';
import 'package:FreeSkills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_4_sub.dart';
import 'package:FreeSkills/pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_5_sub.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:toastification/toastification.dart';

import '../../pages/routes/RoutesNames.dart';
import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/completed_6_sub.dart';
import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_1_sub.dart';
import '../../pages/screens/service_screens/setup_screens/sub_widgets_setup/setup_2_sub.dart';
import '../utils/DataTimeinfo.dart';

class SetupstateProvider extends ChangeNotifier {
  List langlist = [];
  List jonlist = [];
  Map<String, dynamic> userData = {};
  Map<String, dynamic> datainfo = {};
  PageController pc = PageController();
  List errorList = [null, null, null, null, null];
  TextEditingController usernameconller = TextEditingController();
  String? username;
  int currentstate = 0;
  int selectedlevel = -1;
  int selectedlang = -1;
  int selectedjob = -1;
  bool usercopyright = false;
  int currentpage = 0;
  int totalpage = 0;
  bool butnanim = false;
  bool tryagain = false;
  Userdatapack us = Userdatapack();

  void updateanim() {
    butnanim = !butnanim;
    notifyListeners();
  }

  void isdispose() {
    usernameconller.clear();
    currentstate = 0;
    currentstate = 0;
    selectedlevel = -1;
    selectedlang = -1;
    selectedjob = -1;
    usercopyright = false;
    currentpage = 0;
    totalpage = 0;
    butnanim = false;
    tryagain = false;
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

  void changepage() {
    pc.animateToPage(
      currentstate,
      duration: Duration(milliseconds: 300),
      // Specify the duration of the animation
      curve: Curves.easeInOut, // Specify the curve of the animation
    );
  }

  ImageNetworkProvider imageNetworkProvider = ImageNetworkProvider();

  Future<void> updatethebutton(BuildContext ofsetupscreen) async {
    if (currentstate == 0 && errorList[0] == null) {
      if (username == null) {
        updatetherror("Empty Value", 0);
      } else {
        currentstate++;
        changepage();
        userData["username"] = username;
      }
    } else if (currentstate == 1 &&
        errorList[1] == null &&
        selectedlevel != -1) {
      currentstate++;
      changepage();
      userData["level"] = selectedlevel;
    } else if (currentstate == 2 &&
        errorList[2] == null &&
        selectedlang != -1) {
      currentstate++;
      changepage();
      //   print(findKeyByValue(datainfo["datainfo"], langlist[selectedlang]));
      userData["lang"] =
          findKeyByValue(datainfo["datainfo"], langlist[selectedlang])
              .toString();
    } else if (currentstate == 3 && errorList[3] == null && selectedjob != -1) {
      currentstate++;
      changepage();
      //  print(findKeyByValue(datainfo["jobinfo"], jonlist[selectedjob]));
      userData["job"] =
          findKeyByValue(datainfo["jobinfo"], jonlist[selectedjob]).toString();
    } else if (currentstate == 4 && errorList[4] == null && usercopyright) {
      currentstate++;
      changepage();
      User? user = FirebaseAuth.instance.currentUser;
      userData["email"] = user?.email;
      userData["copyrights"] = usercopyright;
      userData["lastlogin"] = Datatimeinfo.getCurrentDateTime();
      userData["ispro"] = false;
      userData["userimageurl"] =
          await imageNetworkProvider.getProfileLink(username!);
      tryagain = await us.addUserData(userData);
      if (tryagain) {
        var box = await Hive.openBox('UserData');
        box.put("data", userData);
        updatethebox(box);
        isdispose();
        ofsetupscreen.go(Routesnames.HomeScreen);
      }
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

  void updatethebox(var box) {
    box.put("info", datainfo);
    notifyListeners();
  }

  void backpage() {
    if (currentstate >= 0) {
      currentstate--;
      pc.animateToPage(
        currentstate,
        duration: Duration(milliseconds: 300),
        // Specify the duration of the animation
        curve: Curves.easeInOut, // Specify the curve of the animation
      );
    }
    notifyListeners();
  }

  Future<void> updatedatainfo(Map<String, dynamic> m) async {
    datainfo = m;
    var box = await Hive.openBox('UserData');
    langlist = datainfo["datainfo"].values.toList();
    jonlist = datainfo["jobinfo"].values.toList();
    updatethebox(box);
    notifyListeners();
  }

  String? findKeyByValue(Map<String, dynamic> map, String value) {
    return map.entries
        .firstWhere((entry) => entry.value == value,
            orElse: () => MapEntry('', ''))
        .key;
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
