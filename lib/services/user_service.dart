import 'dart:async';

import 'package:states_app/models/models.dart';

class _UserService {

  UserModel? _userModel;

  final StreamController<UserModel> _userStreamController = StreamController<UserModel>.broadcast();

  UserModel? get userModel => _userModel;
  bool get isUserNotNull => _userModel != null ? true : false;

  Stream<UserModel> get userStream => _userStreamController.stream;

  void setUser(UserModel userModel) {
    _userModel = userModel;
    _userStreamController.add(userModel);
  }

  void setAge(int age) {
    if (_userModel != null) {
      _userModel!.age = age;
      _userStreamController.add(_userModel!);
    }
  }

}

final userService = _UserService();