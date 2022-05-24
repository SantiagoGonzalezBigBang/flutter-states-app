part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SetUserEvent extends UserEvent {
  final UserModel userModel;
  SetUserEvent(this.userModel);
}

class SetUserAgeEvent extends UserEvent {
  final int age;
  SetUserAgeEvent(this.age);
}

class AddUserProfessionEvent extends UserEvent {
  final String profession;
  AddUserProfessionEvent(this.profession);
}

class DeleteUserEvent extends UserEvent {}

