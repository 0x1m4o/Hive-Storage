import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_storage/pages/homepage.dart';

Box? box;
void main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('box');

  box!.put('name', 'David');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(box: box!),
    );
  }
}
