// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_storage/pages/profile.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  Box? box;
  HomePage({
    Key? key,
    this.box,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ));
            },
            icon: const Icon(Icons.person))
      ]),
    );
  }
}
