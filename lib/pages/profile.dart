import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_storage/cubits/cubit/person_cubit.dart';
import 'package:hive_storage/models/person.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  late Box box;
  Person? savedPerson;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    box = await Hive.openBox('box');
    savedPerson = box.get('person');
    if (savedPerson != null) {
      nameController.text = savedPerson!.name;
      ageController.text = savedPerson!.age;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
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
                  final updatedPerson = Person(
                    name: context.read<PersonCubit>().state.name,
                    age: context.read<PersonCubit>().state.age,
                  );
                  box.put('person', updatedPerson);
                  Navigator.pop(context);
                },
                child: const Text('Submit'))
          ],
        ),
      )),
    );
  }
}
