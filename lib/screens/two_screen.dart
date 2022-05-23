import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_cubit.dart';
import 'package:states_app/models/models.dart';

class TwoScreen extends StatelessWidget {
   
  const TwoScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final userCubit = context.read<UserCubit>();

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
                final UserModel userModel = UserModel(
                  name: 'Santiago', 
                  age: 19, 
                  professions: [
                    'Mobile Developer',
                    'LOL Player'    
                  ]
                );

                userCubit.setUser(userModel);
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
                userCubit.setAge(30);
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
                userCubit.addProfession('Tenista');
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