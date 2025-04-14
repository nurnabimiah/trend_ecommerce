import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/launcher_icon');

  @pragma("vm:entry-point")
  Future<void> initializeNotification() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: _androidInitializationSettings,
    );
    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  @pragma("vm:entry-point")
  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) {
    // Handle the notification response here
    if (kDebugMode) {
      print('Notification payload: ${notificationResponse.payload}');
    }
  }

  @pragma("vm:entry-point")
  Future<void> scheduleDailyNotification(String title, String body) async {
    tz.initializeTimeZones();
    final location = tz.getLocation('Asia/Dhaka');
    final tz.TZDateTime now = tz.TZDateTime.now(location);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(location, now.year, now.month, now.day, 20, 30);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    if (kDebugMode) {
      print('Scheduling notification for: $scheduledDate');
    }

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'daily_notification_channel_id',
      'Daily Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    // await _notificationsPlugin.zonedSchedule(
    //   0,
    //   title,
    //   body,
    //   scheduledDate,
    //   notificationDetails,
    //   //androidAllowWhileIdle: true,
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   matchDateTimeComponents: DateTimeComponents.time,
    // ).then((_) {
    //   if (kDebugMode) {
    //     print('Notification scheduled successfully.');
    //   }
    // }).catchError((error) {
    //   if (kDebugMode) {
    //     print('Error scheduling notification: $error');
    //   }
    // });
  }
}
