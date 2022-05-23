import 'package:flutter/material.dart';
import 'package:states_app/models/models.dart';
import 'package:states_app/services/services.dart';

class TwoScreen extends StatelessWidget {
   
  const TwoScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Text(snapshot.hasData ? 'Name: ${snapshot.data!.name}' : 'Two Screen');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final userModel = UserModel(name: 'Santiago', age: 19);
                userService.setUser(userModel);
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
                userService.setAge(25);
              },
              color: Colors.blue,
              child: const Text(
                'Set Age',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
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