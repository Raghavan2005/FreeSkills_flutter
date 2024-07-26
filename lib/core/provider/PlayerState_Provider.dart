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
  List historylist = [];
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
    var box = Hive.box("UserData");
    issaved = !issaved;
    if (issaved)
      savedlist.add(videoid);
    else
      savedlist.remove(videoid);
    if (savedlist.isNotEmpty) box.put("savedlist", savedlist);
    //print(savedlist);

    notifyListeners();
  }

  void swipupdatesave(String videoid) {
    var box = Hive.box("UserData");
    savedlist.remove(videoid);
    box.put("savedlist", savedlist);
    //print(savedlist);

    notifyListeners();
  }

  void checksatues(String id) {
    var box = Hive.box("UserData");
    historylist.add(id);
    box.put("savedlist", savedlist);
    box.put("historylist", historylist);
    issaved = savedlist.contains(id);
  }

  void updateonstart() {
    var box = Hive.box("UserData");
    savedlist = box.get("savedlist");

    historylist = box.get("historylist");

    //print(savedlist);
  }

  getitemlist(BuildContext c, int index) {
    var box = Hive.box("UserData");
    if (box.get("savedlist") != null) savedlist = box.get("savedlist");
    final usp = Provider.of<UserdatastateProvider>(c, listen: true);
    var itemKey = savedlist[index].toString();
    return item = usp.centraldataset[itemKey];
  }

  getitemhistorlist(BuildContext c, int index) {
    var box = Hive.box("UserData");
    if (box.get("historylist") != null) historylist = box.get("historylist");
    final usp = Provider.of<UserdatastateProvider>(c, listen: true);
    var itemKey = historylist[index].toString();

    return item = usp.centraldataset[itemKey];
  }

  void updateremovehistory(String id) {
    var box = Hive.box("UserData");
    historylist.remove(id);
    box.put("historylist", historylist);

    notifyListeners();
  }
}
