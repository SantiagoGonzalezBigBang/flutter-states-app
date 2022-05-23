part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {

  final isUserNotNull = false;

  @override
  String toString() {
    return 'UserInitial: {isUserNotNull: false}';
  }

}

class UserActive extends UserState {

  final isUserNotNull = true;
  final UserModel userModel;

  UserActive({required this.userModel});

}