import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonState.initial());

  void profileAdd(String name, String age) {
    emit(state.copyWith(name: name, age: age));
  }
}
