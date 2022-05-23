import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/models.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
 
  UserCubit() : super(UserInitial());

  void setUser(UserModel userModel) {
    emit(UserActive(userModel: userModel));
  }

  void setAge(int age) {

    final currentState = state;

    if (currentState is UserActive) {
      final userModel = currentState.userModel.copyWith(age: age);
      emit(UserActive(userModel: userModel));
    }

  }

  void addProfession(String value) {
    final currentState = state;

    if (currentState is UserActive) {
      final professions = [
        ...currentState.userModel.professions,
        value
      ];
      final userModel = currentState.userModel.copyWith(professions: professions);
      emit(UserActive(userModel: userModel));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }

}