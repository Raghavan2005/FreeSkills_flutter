import 'package:flutter/cupertino.dart';

class UserdatastateProvider extends ChangeNotifier {
  String? _Username = null;
  int _selectedcourse = 00;
  String _selectedlang = 'en-(English)';
  String? _profilephoto = null;
  List<int> _performancevalue = [0, 0, 0, 0, 0, 0, 0];

  String? get getUsername => _Username;

  int? get getSelectedcource => _selectedcourse;

  String? get getSelectedlang => _selectedlang;

  String? get getprofilephoto => _profilephoto;

  List? get getperformancevalue => _performancevalue;
}
