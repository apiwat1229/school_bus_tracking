// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StudentPicProfile extends StatelessWidget {
  const StudentPicProfile({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 100,
        backgroundColor: Colors.orange,
        child: CircleAvatar(
          backgroundImage: AssetImage(img),
          // backgroundImage: AssetImage(img),
          radius: 95,
        ));
  }
}
