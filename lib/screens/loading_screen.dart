// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double screensize;
  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 110),
                  width: screensize * 0.70,
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                    child: Text('ระบบติดตามรถโรงเรียน',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold))),
                //? Text Title 2
                SizedBox(height: 10),
                Text(
                  'สำหรับการเดินทางวิถีใหม่',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
