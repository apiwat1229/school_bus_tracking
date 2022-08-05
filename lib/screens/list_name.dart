// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_tracking/read_data/get_username.dart';

class ListNameStudents extends StatefulWidget {
  const ListNameStudents({Key? key}) : super(key: key);

  @override
  State<ListNameStudents> createState() => _ListNameStudentsState();
}

class _ListNameStudentsState extends State<ListNameStudents> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docID = [];

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('Register1')
        .get()
        .then((document) => document.docs.forEach((element) {
              print(element.reference);
              docID.add(element.id);
            }));
  }

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed In as : ' + user.email!),
            Expanded(
                child: FutureBuilder(
              future: getDocID(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docID.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetUserName(documentID: docID[index]),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
