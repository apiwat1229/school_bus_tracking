// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_bus_tracking/screens/map.dart';
import 'package:school_bus_tracking/widgets/drawer_menu.dart';
import 'package:school_bus_tracking/widgets/student_pic_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            StudentPicProfile(img: 'images/boy2.jpg'),
          ],
        ),
      ),
    );
  }
}
