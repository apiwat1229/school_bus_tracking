// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TeacherPicProfile extends StatelessWidget {
  const TeacherPicProfile({Key? key, required this.img}) : super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            child: CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 98,
                child: CircleAvatar(
                  backgroundImage: AssetImage(img),
                  radius: 95,
                )),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: double.infinity,
              child: Column(
                children: [
                  Text('ชื่อคุณครูที่รับผิดชอบ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(children: [
                        Text('อุณหภูมิร่างกาย   :     36.5  C',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(children: [
                        Text('เวลาขึ้นที่รถ          :     07 : 15 Am',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(children: [
                        Text('เวลาขึ้นลงรถ        :     16 : 01 Pm',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]))
                ],
              ))
        ],
      ),
    );
  }
}
