class UserModel {

  UserModel({
    required this.name,
    required this.age,
    required this.professions
  });

  final String name;
  final int age;
  final List<String> professions;

  UserModel copyWith({
    String? name,
    int? age,
    List<String>? professions
  }) => UserModel(
    name: name ?? this.name, 
    age: age ?? this.age,
    professions: professions ?? this.professions
  );

}