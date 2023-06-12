// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  Box box;
  HomePage({
    Key? key,
    required this.box,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Get the name
      body: Center(child: Text(box.get('name'))),
    );
  }
}
