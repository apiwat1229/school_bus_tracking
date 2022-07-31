// ignore_for_file: non_constant_identifier_names, duplicate_ignore, prefer_const_constructors, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

Future<void> normalDialog(
  BuildContext,
  context,
  String SubString,
) async {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              leading: Image.asset('images/logo.png'),
              title: Text('ข้อผิดพลาด !!'),
              subtitle: Text(SubString),
            ),
            children: [
              TextButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: const Text('OK'))
            ],
          ));
}
