import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

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

class LocalNotificationClass {
  static Future<void> createNotificationChannel() async {
    await AwesomeNotifications().initialize(
      null,
      // 'resource://drawable/splash.png',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Alerts',
          channelDescription: 'Notification tests as alerts',
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.High,
          defaultPrivacy: NotificationPrivacy.Private,
          defaultColor: Colors.deepPurple,
          ledColor: Colors.deepPurple,
        )
      ],
      debug: true,
    );
  }

  Future<void> createNewNotification() async {
    String localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Minha notificação',
        body: 'Esta é uma notificação de exemplo do Charles',
        payload: {'data': 'qualquer dado'},
      ),
      schedule: NotificationInterval(
        interval: 5,
        timeZone: localTimeZone,
        repeats: false,
      ),
    );
  }
}
