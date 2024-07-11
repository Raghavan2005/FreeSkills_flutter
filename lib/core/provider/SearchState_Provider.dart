import 'package:flutter/cupertino.dart';

class SearchstateProvider extends ChangeNotifier {
  List<bool> filterstatus = [false, false, false];
  List<String> lastword = ["dsf", "SDg", "fgfd"];

  void updatedfilter(int index) {
    filterstatus[index] = !filterstatus[index];

    notifyListeners();
  }

  void removelastword(int indexrem) {
    lastword.removeAt(indexrem);
    notifyListeners();
  }
}
