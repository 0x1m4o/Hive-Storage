// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_storage/cubits/cubit/person_cubit.dart';
import 'package:hive_storage/models/person.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  late Box box;
  Person? person;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    box = await Hive.openBox('box');
    person = await box.get('person');
    if (person != null) {
      nameController = TextEditingController(text: person!.name);
      ageController = TextEditingController(text: person!.age);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Name',
                  labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Age',
                  labelText: 'Age'),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<PersonCubit>()
                      .profileAdd(nameController.text, ageController.text);
                  box.put(
                      'person',
                      Person(
                          name: context.read<PersonCubit>().state.name,
                          age: context.read<PersonCubit>().state.age));

                  person = box.get('person');
                },
                child: const Text('Submit'))
          ],
        ),
      )),
    );
  }
}
