import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class LocalNotificationModel {
  final int id;
  final String title;
  final String body;
  final String? payload;

  LocalNotificationModel({
    required this.id,
    required this.title,
    required this.body,
    this.payload,
  });
}

class NotificationService {
  final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationDetails androidNotificationDetails;

  NotificationService() {
    _setupAndroidDetails();
    _setupNotifications();
  }

  void _setupAndroidDetails() {
    androidNotificationDetails = const AndroidNotificationDetails(
      "high_importance_channel",
      "Notificações",
      channelDescription: "canal de notificação",
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      playSound: true,
    );
  }

  _setupNotifications() async {
    await _setupTimezone();
    await _initializeNotifications();
  }

  Future<void> _setupTimezone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    await localNotificationsPlugin.initialize(
      const InitializationSettings(android: android),
      onDidReceiveNotificationResponse: _onSelectNotification(),
    );
  }

  _onSelectNotification({String? payload}) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.of(RoutesClass.navigatorKey!.currentContext!)
          .pushNamed(payload);
    }
  }

  showNotificationScheduled(
      LocalNotificationModel notification, Duration duration) {
    final date = DateTime.now().add(duration);

    localNotificationsPlugin.zonedSchedule(
      notification.id,
      notification.title,
      notification.body,
      tz.TZDateTime.from(date, tz.local),
      NotificationDetails(android: androidNotificationDetails),
      payload: notification.payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  showLocalNotification(LocalNotificationModel notification) {
    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(android: androidNotificationDetails),
      payload: notification.payload,
    );
  }

  checkForNotifications() async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {
      _onSelectNotification(payload: details.notificationResponse?.payload);
    }
  }
}
