import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:tarefas_app/class/id_class.dart';
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
  final IdClass _idClass = IdClass();
  final TextClass _textClass = TextClass();

  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/ic_notification',
      [
        NotificationChannel(
          channelKey: 'notification_channel',
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
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: _idClass.generateUniqueId(),
        channelKey: 'notification_channel',
        title: tarefa['tarefa'],
        body: _textClass.stringBodyNotification(tarefa),
        summary: '',
        actionType: ActionType.Default,
        wakeUpScreen: true,
        notificationLayout: NotificationLayout.Messaging,
        autoDismissible: false,
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.parse(tarefa['notificacao']),
        preciseAlarm: true,
      ),
    );
  }

  int dateNowToInt() {
    var currentTimeMillis = DateTime.now().millisecondsSinceEpoch;
    var currentTimeInt32 = currentTimeMillis & 0xFFFFFFFF;
    return currentTimeInt32;
  }
}
