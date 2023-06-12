// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'person_cubit.dart';

class PersonState {
  String name;
  String age;

  factory PersonState.initial() {
    return PersonState(name: '', age: '');
  }
  PersonState({
    required this.name,
    required this.age,
  });

  PersonState copyWith({
    String? name,
    String? age,
  }) {
    return PersonState(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
