import 'package:FreeSkills/core/utils/Appusage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'SeetingsState_Provider.dart';

class UserdatastateProvider extends ChangeNotifier {
  String? _Username = null;
  String? _email = null;
  String? _selectedcourse = '0001';
  String? selectedcoursename = ' ';
  String _selectedlang = 'en-(English)';
  String? userimageurl = '';
  List _performancevalue = [0, 0, 0, 10, 0, 0, 2];
  bool? isprime = null;

  Map<dynamic, dynamic> userData = {};
  Map<dynamic, dynamic> langinfo = {};
  Map<dynamic, dynamic> jobinfo = {};
  Map<dynamic, dynamic> centraldataset = {};
  Map<dynamic, dynamic> centraljoblist = {};
  Map<dynamic, dynamic> infodatalistset = {};
  List<dynamic> newslist = [];
  List<dynamic> notlist = [];

  String? get getUsername => _Username;

  String? get getSelectedcource => _selectedcourse;
  String? get getSelectedemail => _email;
  String? get getSelectedlang => _selectedlang;

  String? get getuserimageurl => userimageurl;

  List? get getperformancevalue => _performancevalue;
  Appusage appusage = Appusage();


  Future<void> updatedata() async {

    var box = Hive.box("UserData");
    jobinfo = await box.get("info")["jobinfo"];
    langinfo = await box.get("info")["datainfo"];
    userData = await box.get("data");
    centraldataset = await box.get("centraldataset");
    centraljoblist = await box.get("centraljoblistdata");
    infodatalistset = await box.get("infodatalistset");
    print("Data Updated");
    interupdata();
    //print("user_provider" + box.get("centraldataset").toString());

    appusage.startserviceprogress(2);
  }

  void loaddatauser() {
    var box = Hive.box("UserData");
     box.put("data", userData);

  }

  void interupdata() {
    _Username = userData['username'];
    _selectedcourse = userData["job"];
    _selectedlang = userData["lang"];
    userimageurl = userData["userimageurl"];
    notlist = infodatalistset["not"];
    newslist = infodatalistset['technews'];
    _email = userData['email'];
    isprime=userData['ispremium'];
    //print(isprime);
    selectedcoursename = searchbykey(jobinfo, _selectedcourse!);
  }

//  List<String> newslist = [];
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
    _selectedcourse= getRoleCode(jobinfo, itemname);

    notifyListeners();
    loaddatauser();
  }

  void changeimageurl(String url){
    userimageurl = url;
    userData['userimageurl'] = userimageurl;
    notifyListeners();
    loaddatauser();
  }

  void changename(String name) {
    userData['username'] = name;
    _Username = userData['username'];
    notifyListeners();
    loaddatauser();
  }
}
