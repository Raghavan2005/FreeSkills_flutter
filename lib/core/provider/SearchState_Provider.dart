import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'UserDataState_Provider.dart';

class SearchstateProvider extends ChangeNotifier {
  List<bool> filterstatus = [true, true, true];
  List<String> lastword = [];
  List<String> searchlist = [];

  void updatedfilter(int index) {
    filterstatus[index] = !filterstatus[index];
    print(filterstatus);
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
          if (filterstatus[0] == true &&
              filterstatus[1] == true &&
              filterstatus[2] == true) {
            searchlist
                .add(item['lang_id'] + item['course_id'] + item['course_type']);
          } else {
            if (filterstatus[0] == false && item['course_type'] == '01') {
              searchlist.add(
                  item['lang_id'] + item['course_id'] + item['course_type']);
            } else if (filterstatus[1] == false &&
                item['course_type'] == '02') {
              searchlist.add(
                  item['lang_id'] + item['course_id'] + item['course_type']);
            } else if (filterstatus[2] == false &&
                item['course_type'] == '03') {
              searchlist.add(
                  item['lang_id'] + item['course_id'] + item['course_type']);
            }
          }
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
