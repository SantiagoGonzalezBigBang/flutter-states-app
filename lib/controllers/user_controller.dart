import 'package:get/get.dart';

import 'package:states_app/models/models.dart';

class UserController extends GetxController {

  RxBool isUserNotNull    = false.obs;
  Rx<UserModel> userModel = UserModel().obs;

  int get professionsLength => userModel.value.professions.length;

  void setUser(UserModel userModel) {
    isUserNotNull.value  = true;    
    this.userModel.value = userModel;
  }

  void serUserAge(int age) {
    userModel.update((val) {
      val!.age = age;
    });
  }

  void addUserProfession(String profession){
    userModel.update((val) {
      val!.professions = [...val.professions, profession];
    });
  }

}