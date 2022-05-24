import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:states_app/controllers/user_controller.dart';
import 'package:states_app/models/models.dart';

class TwoScreen extends StatelessWidget {
   
  const TwoScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    // print(Get.arguments);

    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Two Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                userController.setUser(UserModel(
                  name: 'Santiago',
                  age: 19,                  
                ));
                Get.snackbar(
                  'Usuario establecido', 
                  'Santiago es el nombre del usuario',
                  // backgroundColor: Colors.white,
                  boxShadows: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10.0
                    )
                  ]
                );
              },
              color: Colors.blue,
              child: const Text(
                'Set User',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            MaterialButton(
              onPressed: () => userController.serUserAge(30),
              color: Colors.blue,
              child: const Text(
                'Change Age',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            MaterialButton(
              onPressed: () => userController.addUserProfession(
                'New Profession #${userController.professionsLength + 1}'
              ),
              color: Colors.blue,
              child: const Text(
                'Add Profession',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              color: Colors.blue,
              child: const Text(
                'Change Theme',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}