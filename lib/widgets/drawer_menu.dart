// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_tracking/screens/auth_page.dart';
import 'package:school_bus_tracking/screens/home_page.dart';
import 'package:school_bus_tracking/screens/login.dart';
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
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AllUserShow()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: const Text('ข้อมูลส่วนตัว'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
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
            title: const Text('รายชื่อนักเรียนทั้งหมด'),
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
              });
            },
          ),
        ],
      ),
    );
  }
}
