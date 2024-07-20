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

import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';

class Appusage {
  List<Map<String, String>> usagehistory = [];

  List<Map<String, String>> getWeekDates(DateTime startDate) {
    // Find the previous Monday if the start date is not a Monday
    while (startDate.weekday != DateTime.monday) {
      startDate = startDate.subtract(Duration(days: 1));
    }

    List<Map<String, String>> weekDates = [];
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    for (int i = 0; i < 7; i++) {
      DateTime date = startDate.add(Duration(days: i));
      String formattedDate = dateFormat.format(date);
      String dayOfWeek = daysOfWeek[i];
      weekDates.add({'day': dayOfWeek, 'date': formattedDate, 'stats': '0'});
    }

    return weekDates;
  }

  List<Map<String, String>> getvalue() {
    return usagehistory;
  }

  List<Map<String, String>> getCurrentWeekDates(
      DateTime currentDate, List<Map<String, String>> weekDates) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedCurrentDate = dateFormat.format(currentDate);

    // Check if the current date is within the weekDates
    bool isCurrentDateInWeek =
        weekDates.any((dateMap) => dateMap['date'] == formattedCurrentDate);

    // If current date is not in the weekDates, generate a new weekDates starting from the current date
    if (!isCurrentDateInWeek) {
      return getWeekDates(currentDate);
    }

    return weekDates;
  }

  bool isCurrentDateInWeek(
      DateTime currentDate, List<Map<String, String>> weekDates) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedCurrentDate = dateFormat.format(currentDate);

    // Check if the current date is within the weekDates
    return weekDates.any((dateMap) => dateMap['date'] == formattedCurrentDate);
  }

  void startserviceprogress(int addvalue) {
    var box = Hive.box('UserData');
    DateTime currentDate = DateTime.now();
    var rawUsageHistory = box.get("progresshistory", defaultValue: []);

    // Cast the retrieved data to List<Map<String, String>>
    usagehistory = (rawUsageHistory as List).map((item) {
      return (item as Map)
          .map((key, value) => MapEntry(key as String, value as String));
    }).toList();

    if (usagehistory.isEmpty) {
      //First Time
      usagehistory = getWeekDates(currentDate);
      box.put("progresshistory", usagehistory);
    } else {
      if (isCurrentDateInWeek(currentDate, usagehistory)) {
        //print(usagehistory);
        updateStatsForCurrentDate(usagehistory, addvalue);
        box.put("progresshistory", usagehistory);
        // Execute your required code here
      } else {
        //new Day or week
        usagehistory = getWeekDates(currentDate);
        box.put("progresshistory", usagehistory);
      }
    }
  }

  void updateStatsForCurrentDate(
      List<Map<String, dynamic>> weekDates, int addvalue) {
    DateTime currentDate = DateTime.now();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedCurrentDate = dateFormat.format(currentDate);

    for (var dateMap in weekDates) {
      if (dateMap['date'] == formattedCurrentDate) {
        int currentStats = int.parse(dateMap['stats']);
        currentStats += addvalue;
        dateMap['stats'] = currentStats.toString();
        break;
      }
    }
  }

  void clearvalue() {
    var box = Hive.box('UserData');
    box.delete("progresshistory");
  }
}
