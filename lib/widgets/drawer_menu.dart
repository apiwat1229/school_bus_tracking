// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_tracking/screens/driver_page.dart';
import 'package:school_bus_tracking/screens/home_page.dart';
import 'package:school_bus_tracking/screens/list_name.dart';
import 'package:school_bus_tracking/screens/main_page.dart';
import 'package:school_bus_tracking/screens/map.dart';
import 'package:school_bus_tracking/screens/profile.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.email!),
            accountEmail: Text('inwaui1229@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(
                size: 40.0,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('หน้าแรก'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                            payload: 'paylaod',
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: const Text('ข้อมูลคนขับรถ'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DriverProfile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: const Text('ตำแหน่งปัจจุบันของรถ'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MapPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: const Text('รายชื่อนักเรียนทั้งหมดนรถ'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListNameStudents()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_important_outlined),
            title: const Text('ทดสอบระบบแจ้งเตือน'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('ออกจากระบบ'),
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                print('Sign Out Complete');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              });
            },
          ),
        ],
      ),
    );
  }
}
