import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_storage/cubits/cubit/person_cubit.dart';
import 'package:hive_storage/models/person.dart';
import 'package:hive_storage/pages/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Box? box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  box = await Hive.openBox('box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonCubit(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
