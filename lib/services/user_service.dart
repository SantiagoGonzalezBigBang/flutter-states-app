import 'package:flutter/material.dart';
import 'package:states_app/models/models.dart';

class UserService with ChangeNotifier {

  UserModel? _userModel;

  UserModel? get userModel => _userModel;
  set userModel(UserModel? userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  bool get isUserModelNotNull => _userModel != null ? true : false;

  set age(int age) {
    if (_userModel != null) {
      _userModel!.age = age;
      notifyListeners();
    }
  }

  void addProfession() {
    if (_userModel != null && _userModel!.professions != null) {
      _userModel!.professions!.add(
        'Profession ${_userModel!.professions!.length + 1}'
      );      
    } else {
      _userModel!.professions = ['Profession 1'];
    }
    notifyListeners();
  }

  void removeUser() {
    _userModel = null;
    notifyListeners();
  }
}