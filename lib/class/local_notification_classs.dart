import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:tarefas_app/class/text_class.dart';
import 'package:tarefas_app/theme/ui_color.dart';

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
  final TextClass _textClass = TextClass();

  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/ic_notification',
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
          defaultColor: UiColor.background,
        )
      ],
      debug: true,
    );
  }

  Future<void> createNewNotification(Map<String, dynamic> tarefa) async {
    String localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: tarefa['title'],
        body: _textClass.stringLegenda(tarefa),
      ),
      schedule: NotificationInterval(
        interval: 5,
        timeZone: localTimeZone,
        repeats: false,
      ),
    );
  }
}
