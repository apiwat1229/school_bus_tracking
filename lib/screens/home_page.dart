// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_tracking/screens/profile.dart';
import 'package:school_bus_tracking/widgets/show_notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed In as : ' + user.email!),
          ElevatedButton(
              onPressed: () async {
                await service.showNotification(
                  id: 0,
                  title: 'ทดสอบระบบแจ้งเตือน 1',
                  body: 'ข้อความแจ้งเตือน 1',
                );
              },
              child: const Text('ทดสอบระบบแจ้งเตือน 1')),
          ElevatedButton(
              onPressed: () async {
                await service.showScheduleNotification(
                  id: 0,
                  title: 'ทดสอบระบบแจ้งเตือน 2',
                  body: 'ข้อความแจ้งเตือน 2',
                  seconds: 6,
                );
              },
              child: const Text('ทดสอบระบบแจ้งเตือน 2')),
          // ElevatedButton(
          //     onPressed: () async {
          //       // await service.showNotificationWithPayload(
          //       //     id: 0,
          //       //     title: 'title',
          //       //     body: 'body',
          //       //     payload: 'pay navigation');
          //     },
          //     child: const Text('Show Local Notification With Payload'))
        ],
      )),
    );
  }

  void listenToNotification() =>
      service.onNotificationonClick.stream.listen(onNotificationListen);

  void onNotificationListen(String? payload) {
    if (payload != null && payload.isEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => ProfilePage(payload: payload))));
    }
  }
}
