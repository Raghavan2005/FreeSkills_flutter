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
      weekDates.add({'day': dayOfWeek, 'date': formattedDate});
    }

    return weekDates;
  }

  List<Map<String, String>> getCurrentWeekDates(
      DateTime currentDate, List<Map<String, String>> weekDates) {
    DateFormat dateFormat = DateFormat('MM/dd/yyyy');
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

  void getapp() {
    DateTime startDate = DateTime(2024, 7, 22); // Example start date
    DateTime currentDate = DateTime.now(); // Current date

    List<Map<String, String>> weekDates =
        getWeekDates(startDate); // if the data is null when first time load
    weekDates = getCurrentWeekDates(
        currentDate, weekDates); //update if the below the contitional
    print(
        isCurrentDateInWeek(startDate, weekDates)); //main test always tes tthis
    for (var date in weekDates) {
      print(date);
    }
  }
}
