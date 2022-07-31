// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final fullNameController = TextEditingController();

  final ageController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    fullNameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  //? Auth Create User //

  Future signUp() async {
    ////* Create New User ////

    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      ////* Add User Details ////

      addUserDetails(
          fullNameController.text.trim(), emailController.text.trim());
    }
  }

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance
        .collection('user')
        .add({'Full Name': name, 'Email ': email});
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? Text Title 1
              SizedBox(height: 20),
              Center(
                  child: Text('ระบบติดตามรถโรงเรียน',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold))),

              //? Text Title 2
              SizedBox(height: 10),
              Text(
                'สำหรับการเดินทางวิถีใหม่',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),

              //? FirstName TextField

              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: 'ชื่อ - นามสกุล'),
                    ),
                  ),
                ),
              ),

              //? Email Input Field

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: 'อีเมล'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //? Password Input Field

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: 'รหัสผ่าน'),
                    ),
                  ),
                ),
              ),

              //? Confirm Password Filed
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: 'ยืนยันรหัสผ่าน'),
                    ),
                  ),
                ),
              ),

              //? SignIn Button

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'สมัครสมาชิก',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),

              //? Create Ner User

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ฉันเป็นสมาชิกแล้ว !  '),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      'เข้าสู่ระบบตอนนี้',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
