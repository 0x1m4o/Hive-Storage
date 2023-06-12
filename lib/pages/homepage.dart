import 'package:flutter/material.dart';
import 'package:hive_storage/pages/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ));
            },
            icon: const Icon(Icons.person))
      ]),
    );
  }
}
