import 'dart:convert';
import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationService {
  // Singleton instance
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  // Initialize the notification service
  Future<void> initializeNotifications() async {
    await AwesomeNotifications().initialize(
      'resource://mipmap/ic_launcher', // App icon
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notification channel for periodic notifications',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          playSound: false
        ),
      ],
    );
    _checkAndRequestPermission();
  }

  // Check and request notification permissions
  void _checkAndRequestPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  // Fetch and show notification based on the time of day
  Future<void> showNotificationBasedOnTime() async {
    String jsonString = await rootBundle.loadString('assets/notifications.json');
    final Map<String, dynamic> notifications = jsonDecode(jsonString);
    AwesomeNotifications().cancelAll();
    final hour = DateTime.now().hour;
    String key;

    if (hour >= 6 && hour < 12) {
      key = 'morning';
    } else if (hour >= 12 && hour < 17) {
      key = 'afternoon';
    } else if (hour >= 17 && hour < 21) {
      key = 'evening';
    } else if (hour >= 21 || hour < 6) {
      key = 'night';
    } else {
      key = 'midnight';
    }

    // Pick a random notification from the available options
    if (notifications.containsKey(key)) {
      final random = Random();
      final notification = notifications[key][random.nextInt(notifications[key].length)];

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
          channelKey: 'basic_channel',
          title: notification['title'],
          body: notification['body'],
        ),
      );
    }
  }
}
