// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double screensize;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                width: screensize * 0.65,
                child: Image(
                  image: AssetImage('images/logo.png'),
                ),
              ),

              //? Text Title 1
              SizedBox(height: 20),
              Center(
                  child: Text('ระบบติดตามรถโรงเรียน',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold))),

              //? Text Title 2
              SizedBox(height: 10),
              Text(
                'สำหรับการเดินทางวิถีใหม่',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),

              //? Email Input Field

              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              //? Password Input Field

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: 'Password'),
                    ),
                  ),
                ),
              ),

              //! Login Button

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: const Size(240, 45),
                            primary: Colors.orange, onPrimary: Colors.white,
                          ),
                          onPressed: signIn,
                          child: Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    )),
              ),

              //? Create Ner User

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ยังไม่ได้เป็นสมากชิก?  '),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      'สมัครสมาชิก',
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
