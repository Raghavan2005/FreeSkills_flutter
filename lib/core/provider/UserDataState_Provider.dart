import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UserdatastateProvider extends ChangeNotifier {
  String? _Username = null;
  String? _selectedcourse = '00';
  String _selectedlang = 'en-(English)';
  String? _profilephoto = null;
  List<int> _performancevalue = [0, 0, 0, 0, 0, 0, 0];
  Map<String, dynamic> userData = {};
  Map<String, dynamic> datainfo = {};

  String? get getUsername => _Username;

  String? get getSelectedcource => _selectedcourse;

  String? get getSelectedlang => _selectedlang;

  String? get getprofilephoto => _profilephoto;

  List? get getperformancevalue => _performancevalue;
  var box;

  void updatedata() {
    var box = Hive.box("UserData");
    _Username = box.get("data")['username'];
    print(box.get("info"));
    //  datainfo = box.get("info");
    //_selectedcourse = box.get("data")["job"].toString();
    //_selectedlang = box.get("data")["lang"].toString();
    print(box.get("data"));
    interupdata();
    notifyListeners();
  }

  void interupdata() {
    //  _Username = userData['username'];
    //_selectedcourse = userData['job'];
    notifyListeners();
  }
}
