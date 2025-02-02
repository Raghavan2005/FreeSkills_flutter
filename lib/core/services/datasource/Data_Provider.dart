import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataProvider with ChangeNotifier {
  bool _isInitialized = false;
  bool _isLoading = false;
  Map<String, dynamic> _data = {};
  Map<String, dynamic> joblistdata = {};
  Map<String, dynamic> infodatalistset = {};

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
    notifyListeners();
  }

  // Update data daily
  Future<void> dailyDataUpdate() async {
    if (!_isInitialized) {
      await initializeUserData();
    }

    _isLoading = true;
    notifyListeners();

    var box = await Hive.openBox('UserData');
    var currentDate = DateTime.now().toIso8601String().split('T').first;
    var lastFetchDate = box.get('lastFetchDate');

    bool fetchFromServer =
        true; // Flag to determine if data should be fetched from server

    // Check if the data was fetched today
    if (lastFetchDate == currentDate) {
      var temp = box.get('centraldataset');
      if (temp != null) {
        _data = Map<String, dynamic>.from(temp);
        fetchFromServer = false;
      } else {
        // print('Error: No data found in local storage, will fetch from server.');
      }
    }

    if (fetchFromServer) {
      try {
        // Attempt to fetch data from Supabase
        final response =
            await Supabase.instance.client.from('main_table').select();
        if (response.isNotEmpty) {
          Map<String, dynamic> temp = response[0]['json_data'];
          Map<String, dynamic> temp1 = response[2]['json_data'];
          Map<String, dynamic> temp2 = response[1]['json_data'];
// fixed somehow just change the superbase row index (may be i drag it down and done this mess not sure
// now it fixed :)))
          await box.put('centraldataset', temp);
          await box.put('centraljoblistdata', temp1);
          await box.put('infodatalistset', temp2);
          await box.put(
              'lastFetchDate', currentDate); // Update the last fetch date
          _data = Map<String, dynamic>.from(temp);
        } else {
          //  print('Error: Response is empty or null');
          _data = {};
        }
      } catch (error) {
        //print('Error fetching data: $error');
        _data = {};
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
