import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/models.dart';
import 'package:states_app/bloc/user/user_bloc.dart';

class OneScreen extends StatelessWidget {
   
  const OneScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One Screen'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false).add(DeleteUserEvent());
            }, 
            icon: const Icon(
              Icons.delete_outline
            )
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.userIsNotNull 
            ? UserInformation(userModel: state.userModel!) 
            : const Center(
              child: Text('No hay informacion del usuario'),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'two'),
        child: const Icon(Icons.accessibility_new),
      ),
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