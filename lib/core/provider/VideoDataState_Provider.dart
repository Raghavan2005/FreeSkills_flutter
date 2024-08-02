/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +   Freeskills (Andorid&iso)                                                 +
 +   Copyright (c) 2024 Raghavan                                              +
 +   GitHub: https://github.com/raghavan2005                                  +
 +   All rights reserved..                                                    +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'UserDataState_Provider.dart';

class VideodatastateProvider extends ChangeNotifier {
  List<String> toptrendslist = [];
  List<String> expreimentyour = [];
  dynamic cclist = [];

  void onstartandloadthelist(BuildContext c) {
    getaitemdata(c);
    print(toptrendslist.length);
    print(expreimentyour.length);
  }

  dynamic getaitemdata(BuildContext c) {
    final value = Provider.of<UserdatastateProvider>(c, listen: false);
    //getting the cc only data
    value.centraldataset.forEach((key, value) {
      if (expreimentyour.length < 10 && value['course_type'] == '03') {
        expreimentyour.add(key);
      }
    });
    //print(expreimentyour);
    var random = Random();
    List randomNumbers = List.generate(
        10, (_) => random.nextInt(value.centraldataset.keys.toList().length));
    List test = value.centraldataset.keys.toList();
    randomNumbers.forEach((value) {
      toptrendslist.add(test[value]);
    });
  }
}
