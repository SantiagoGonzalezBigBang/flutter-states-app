part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool userIsNotNull;
  final UserModel? userModel;

  const UserState({
    this.userIsNotNull = false, 
    this.userModel
  });

}

class UserInitialState extends UserState {
  const UserInitialState() : super(
    userIsNotNull: false, 
    userModel: null
  );
}

class UserSetState extends UserState {

  const UserSetState(UserModel userModel) 
    : super(userIsNotNull: true, userModel: userModel);

}