/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +   Freeskills (Android & iOS)                                               +
 +   Copyright (c) 2024 Raghavan                                              +
 +   GitHub: https://github.com/raghavan2005                                  +
 +   All rights reserved.                                                     +
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataProvider with ChangeNotifier {
  bool _isInitialized = false;
  bool _isLoading = false;
  Map<String, dynamic> _data = {};

  bool get isInitialized => _isInitialized;

  bool get isLoading => _isLoading;

  Map<String, dynamic> get data => _data;

  // Initialize user data when the app starts
  Future<void> initializeUserData() async {
    var box = await Hive.openBox('UserData');
    var currentDate = DateTime.now().toIso8601String().split('T').first;
    if (box.get('lastFetchDate') == null) {
      await box.put('lastFetchDate', currentDate);
    }
    _isInitialized = true;

    // Delay notifyListeners to avoid calling it during build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  // Update data daily
  Future<Map<String, dynamic>> dailyDataUpdate() async {
    if (!_isInitialized) {
      await initializeUserData();
    }

    _isLoading = true;
    notifyListeners();

    var box = await Hive.openBox('UserData');
    var currentDate = DateTime.now().toIso8601String().split('T').first;
    var lastFetchDate = box.get('lastFetchDate');

    // Check if the data was fetched today
    if (lastFetchDate == currentDate) {
      var temp = box.get("centraldataset");
      if (temp != null) {
        _data = Map<String, dynamic>.from(temp);
        _isLoading = false;

        // Delay notifyListeners to avoid calling it during build phase
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifyListeners();
        });
        return _data;
      } else {
        print('Error: No data found in local storage');
        _isLoading = false;

        // Delay notifyListeners to avoid calling it during build phase
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifyListeners();
        });
        return {};
      }
    }

    try {
      // Attempt to fetch data from Supabase
      final response =
          await Supabase.instance.client.from('main_table').select();

      // Check if the response has data and is not empty
      if (response != null && response != null && response.isNotEmpty) {
        // Assuming response.data is a List of Map<String, dynamic>
        Map<String, dynamic> temp = response[0]['json_data'];

        // Optionally store the data in Hive
        await box.put("centraldataset", temp);
        await box.put(
            'lastFetchDate', currentDate); // Update the last fetch date

        _data = Map<String, dynamic>.from(temp);
        _isLoading = false;

        // Delay notifyListeners to avoid calling it during build phase
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifyListeners();
        });
        return _data;
      } else {
        // Handle the case where the response is empty
        print('Error: Response is empty or null');
        _isLoading = false;

        // Delay notifyListeners to avoid calling it during build phase
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifyListeners();
        });
        return {};
      }
    } catch (error) {
      // Log the error
      print('Error fetching data: $error');
      _isLoading = false;

      // Delay notifyListeners to avoid calling it during build phase
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      return {};
    }
  }
}
