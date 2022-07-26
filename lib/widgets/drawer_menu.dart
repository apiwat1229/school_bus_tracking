// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:school_bus_tracking/screens/loading_screen.dart';
import 'package:school_bus_tracking/screens/login.dart';
import 'package:school_bus_tracking/screens/map.dart';
import 'package:school_bus_tracking/screens/profile.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Apiwat Sukjareon'),
            accountEmail: Text('inwaui1229@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(
                size: 40.0,
              ),
              backgroundColor: Colors.white,
            ),
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
            leading: Icon(Icons.home),
            title: const Text('หน้าแรก'),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => LoadingScreen()));
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
            leading: Icon(Icons.logout),
            title: const Text('ออกจากระบบ'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
