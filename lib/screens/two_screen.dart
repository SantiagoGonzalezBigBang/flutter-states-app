import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/models.dart';

class TwoScreen extends StatelessWidget {
   
  const TwoScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context);

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

                final userModel = UserModel(
                  name: 'Santiago', 
                  age: 19,
                  professions: [
                    'Flutter Developer',
                    'Lol player'
                  ]
                );

                userBloc.add(SetUserEvent(userModel));
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
                userBloc.add(SetUserAgeEvent(30));
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
                if (userBloc.state.userIsNotNull) {
                  userBloc.add(
                    AddUserProfessionEvent('New Profession ${userBloc.state.userModel!.professions.length + 1}')
                  );
                }
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