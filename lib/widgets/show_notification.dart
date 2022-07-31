// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();
  final localNotificationService = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String?> onNotificationonClick = BehaviorSubject();

  Future<void> intialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_stat_accessibility');
    //AndroidInitializationSettings('@mipmap/ic_launcher');

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
            requestAlertPermission: true,
            requestSoundPermission: true,
            requestBadgePermission: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await localNotificationService.initialize(settings,
        onSelectNotification: onSelectNotification);
  }

  Future<NotificationDetails> notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);

    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails();

    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await notificationDetails();
    await localNotificationService.show(id, title, body, details);
  }

  Future<void> showScheduleNotification(
      {required int id,
      required String title,
      required String body,
      required int seconds}) async {
    final details = await notificationDetails();
    await localNotificationService.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          DateTime.now().add(Duration(seconds: seconds)),
          tz.local,
        ),
        details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> showNotificationWithPayload(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    final details = await notificationDetails();
    await localNotificationService.show(id, title, body, details,
        payload: payload);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

  void onSelectNotification(String? payload) {
    print('payload $payload');
    if (payload != null && payload.isEmpty) {
      onNotificationonClick.add(payload);
    }
  }
}
