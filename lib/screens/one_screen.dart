import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:states_app/controllers/user_controller.dart';
import 'package:states_app/models/models.dart';

class OneScreen extends StatelessWidget {
   
  const OneScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('One Screen'),
      ),
      body: Obx(
        () => userController.isUserNotNull.value 
          ? UserInformation(userModel: userController.userModel.value)
          : const NoInfo(),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushNamed(context, 'two'),
        onPressed: () => Get.toNamed('two', arguments: {
          'name': 'Santiago',
          'age' : 19
        }),
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay informacion del usuario'),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key, 
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Name: ${userModel.name}'),
          ),
          ListTile(
            title: Text('Age: ${userModel.age}'),
          ),
          const Text(
            'Professions',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const Divider(),
          ...userModel.professions.map((e) => ListTile(
            title: Text(e),
          )).toList()
        ],
      ),
    );
  }
}