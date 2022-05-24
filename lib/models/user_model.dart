class UserModel {

  UserModel({
    this.name,
    this.age,
    this.professions = const []
  });

  String? name;
  int? age;
  List<String> professions;

}