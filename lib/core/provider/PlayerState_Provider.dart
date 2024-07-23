import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'UserDataState_Provider.dart';

class PlayerstateProvider extends ChangeNotifier {
  bool _isFullscreen = false;
  double _videoPlayStatus = 435.0;

  var item;

  bool get isFullscreen => _isFullscreen;

  double get videoPlayStatus => _videoPlayStatus;

  List savedlist = [];
  bool issaved = false;

  void updateIsFullscreen(bool isFullscreen) {
    _isFullscreen = isFullscreen;
    notifyListeners();
  }

  void updatevideostatus(double value) {
    _videoPlayStatus = value;
    notifyListeners();
  }

  void updatesave(String videoid) {
    issaved = !issaved;
    if (issaved)
      savedlist.add(videoid);
    else
      savedlist.remove(videoid);
    if (savedlist.isNotEmpty) box.put("savedlist", savedlist);
    print(savedlist);

    notifyListeners();
  }

  void swipupdatesave(String videoid) {
    savedlist.remove(videoid);
    box.put("savedlist", savedlist);
    print(savedlist);

    notifyListeners();
  }

  var box;

  void checksatues(String id) {
    box = Hive.box("UserData");
    savedlist = box.get("savedlist");
    issaved = savedlist.contains(id);
  }

  getitemlist(BuildContext c, int index) {
    final usp = Provider.of<UserdatastateProvider>(c, listen: true);
    var itemKey = savedlist[index].toString();
    return item = usp.centraldataset[itemKey];
  }
}
