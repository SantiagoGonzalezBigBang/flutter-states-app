class UserModel {

  UserModel({
    required this.name,
    this.age,
    this.professions
  });

  String name;
  int? age;
  List<String>? professions;

}