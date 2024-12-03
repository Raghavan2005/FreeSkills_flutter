import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'UserDataState_Provider.dart';

class VideodatastateProvider extends ChangeNotifier {
  List<String> toptrendslist = [];
  List<String> expreimentyour = [];

  void onstartandloadthelist(BuildContext c) {
    getaitemdata(c);
  }

  void getaitemdata(BuildContext c) {
    final value = Provider.of<UserdatastateProvider>(c, listen: false);
    final centralDataset = value.centraldataset;

    // Clear previous lists
    toptrendslist.clear();
    expreimentyour.clear();

    // Getting `expreimentyour` data
    centralDataset.forEach((key, data) {
      if (expreimentyour.length < 10 && data['course_type'] == '03') {
        expreimentyour.add(key as String); // Cast key to String
      }
    });

    // Get keys not in `expreimentyour`
    List<String> remainingKeys = centralDataset.keys
        .where((key) => !expreimentyour.contains(key as String))
        .map((key) => key as String)
        .toList();

    // Generate random unique selections for `toptrendslist`
    var random = Random();
    while (toptrendslist.length < 10 && remainingKeys.isNotEmpty) {
      int randomIndex = random.nextInt(remainingKeys.length);
      toptrendslist.add(remainingKeys[randomIndex]);
      remainingKeys.removeAt(randomIndex); // Ensure no repetition
    }

    // Notify listeners in case the UI is dependent on these lists
    notifyListeners();
  }
}
