import 'package:FreeSkills/core/utils/Appusage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UserdatastateProvider extends ChangeNotifier {
  String? _Username = null;
  String? _selectedcourse = '00';
  String? selectedcoursename = ' ';
  String _selectedlang = 'en-(English)';
  String? _profilephoto = null;
  String? userimageurl = '';
  List _performancevalue = [0, 0, 0, 10, 0, 0, 2];
  Map<dynamic, dynamic> userData = {};
  Map<dynamic, dynamic> langinfo = {};
  Map<dynamic, dynamic> jobinfo = {};

  String? get getUsername => _Username;

  String? get getSelectedcource => _selectedcourse;

  String? get getSelectedlang => _selectedlang;

  String? get getprofilephoto => _profilephoto;

  List? get getperformancevalue => _performancevalue;
  var box;
  Appusage appusage = Appusage();

  void updatedata() {
    var box = Hive.box("UserData");

    jobinfo = box.get("info")["jobinfo"];
    langinfo = box.get("info")["datainfo"];
    userData = box.get("data");
    interupdata();
    appusage.startserviceprogress(2);
  }

  void interupdata() {
    _Username = userData['username'];
    _selectedcourse = userData["job"];
    _selectedlang = userData["lang"];
    userimageurl = userData["userimageurl"];
    selectedcoursename = searchbykey(jobinfo, _selectedcourse!);
  }

  String searchbykey(Map<dynamic, dynamic> m, String type) {
    return m[type];
  }

  String getRoleCode(Map<dynamic, dynamic> m, String description) {
    // Iterate through the map to find the corresponding key
    dynamic roleCode;
    m.forEach((key, value) {
      if (value == description) {
        roleCode = key;
      }
    });
    return roleCode;
  }

  void changecourse(String itemname) {
    selectedcoursename = itemname;
    userData['job'] = getRoleCode(jobinfo, itemname);
    notifyListeners();
  }

  void changename(String name) {
    userData['username'] = name;
    _Username = userData['username'];
    notifyListeners();
  }
}
