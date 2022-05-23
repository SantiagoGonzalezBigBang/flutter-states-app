import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/models/user_model.dart';
import 'package:states_app/services/services.dart';

class TwoScreen extends StatelessWidget {
   
  const TwoScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userService.isUserModelNotNull 
            ? 'Name: ${userService.userModel!.name}' 
            : 'Two Screen'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final userModel = UserModel(
                  name: 'Santiago',
                  age: 19,
                  professions: [
                    'Fullstack Developer',
                    'LOL Player'
                  ]
                );
                userService.userModel = userModel;                
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
              onPressed: () {
                userService.age = 25;
              },
              color: Colors.blue,
              child: const Text(
                'Change Age',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userService.addProfession();
              },
              color: Colors.blue,
              child: const Text(
                'Add Profession',
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