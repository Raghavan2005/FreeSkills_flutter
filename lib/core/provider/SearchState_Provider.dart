import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'UserDataState_Provider.dart';

class SearchstateProvider extends ChangeNotifier {
  List<bool> filterstatus = [false, false, false];
  List<String> lastword = ["01005503", "01005603"];
  List<String> searchlist = [];

  void updatedfilter(int index) {
    filterstatus[index] = !filterstatus[index];

    notifyListeners();
  }

  void removelastword(int indexrem) {
    lastword.removeAt(indexrem);
    notifyListeners();
  }

  void getsearchlist(String char, BuildContext c) {
    final usp = Provider.of<UserdatastateProvider>(c, listen: false);
    searchlist.clear();
    usp.centraldataset.forEach((key, value) {
      var item = usp.centraldataset[key];
      if (item != null && item.containsKey("course_title")) {
        String courseTitle = item["course_title"].toLowerCase();

        // Check if courseTitle contains the given char string
        if (courseTitle.contains(char.toLowerCase())) {
          searchlist
              .add(item['lang_id'] + item['course_id'] + item['course_type']);
        }
      } else {
        print("Item or course title not found.");
      }
    });
    notifyListeners();
  }

  dynamic getitemdata(BuildContext c, String id) {
    final value = Provider.of<UserdatastateProvider>(c, listen: false);
    return value.centraldataset[id];
  }
}
