import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/models.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(const UserInitialState()) {

    on<SetUserEvent>((event, emit) => emit(UserSetState(event.userModel)));

    on<SetUserAgeEvent>(
      (event, emit) {
        if(state.userIsNotNull) {
          emit(UserSetState(state.userModel!.copyWith(age: event.age)));
        }
      } 
    );

    on<AddUserProfessionEvent>(
      (event, emit) {
        if(state.userIsNotNull) {
          final List<String> professions = [
            ...state.userModel!.professions,
            event.profession
          ];
          emit(UserSetState(state.userModel!.copyWith(professions: professions)));
        }
      } 
    );

    on<DeleteUserEvent>((event, emit) => emit(const UserInitialState()));

  }

}