// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentID;
  GetUserName({required this.documentID});

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection('Register1');
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('ชื่อ ${data['name']}');
        }
        return Text('loading');
      },
    );
  }
}
