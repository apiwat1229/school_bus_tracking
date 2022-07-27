// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_tracking/widgets/drawer_menu.dart';
import 'package:school_bus_tracking/widgets/student_pic_profile.dart';
import 'package:school_bus_tracking/widgets/teacher_pic_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ข้อมูลส่วนตัว"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StudentPicProfile(
              img: 'images/boy2.jpg',
              temp: 34.5,
            ),
            TeacherPicProfile(img: 'images/girl.jpg')
          ],
        ),
      ),
    );
  }
}
