import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UserdatastateProvider extends ChangeNotifier {
  String? _Username = null;
  String? _selectedcourse = '00';
  String? selectedcoursename = ' ';
  String _selectedlang = 'en-(English)';
  String? _profilephoto = null;
  List<int> _performancevalue = [0, 0, 0, 0, 0, 0, 0];
  Map<dynamic, dynamic> userData = {};
  Map<dynamic, dynamic> langinfo = {};
  Map<dynamic, dynamic> jobinfo = {};

  String? get getUsername => _Username;

  String? get getSelectedcource => _selectedcourse;

  String? get getSelectedlang => _selectedlang;

  String? get getprofilephoto => _profilephoto;

  List? get getperformancevalue => _performancevalue;
  var box;

  void updatedata() {
    var box = Hive.box("UserData");

    jobinfo = box.get("info")["jobinfo"];
    langinfo = box.get("info")["datainfo"];
    userData = box.get("data");
    //  print(userData["job"]);
    //  datainfo = box.get("info");

    interupdata();
    // notifyListeners();
  }

  void interupdata() {
    _Username = userData['username'];
    _selectedcourse = userData["job"];
    _selectedlang = userData["lang"];
    selectedcoursename = searchbykey(jobinfo, _selectedcourse!);
    //  notifyListeners();
  }

  String searchbykey(Map<dynamic, dynamic> m, String type) {
    return m[type];
  }
}
