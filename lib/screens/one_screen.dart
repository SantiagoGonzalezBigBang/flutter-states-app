import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/models.dart';
import 'package:states_app/bloc/user/user_cubit.dart';

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
            onPressed: () => context.read<UserCubit>().deleteUser(),
            icon: const Icon(
              Icons.exit_to_app
            )
          )
        ],
      ),
      body: const ScaffoldBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'two'),
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {

  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {

        switch (state.runtimeType) {
          case UserInitial:
            return const Center(
              child: Text('No hay informacion del usuario'),
            );
          case UserActive:
            return UserInformation(userModel: (state as UserActive).userModel);
          default:
            return const Center(
              child: Text('Unknow State'),
            );
        }


        // if (state is UserInitial) {
        //   return const Center(
        //     child: Text('No hay informacion del usuario'),
        //   );
        // } else if (state is UserActive){            
        //   return UserInformation(userModel: state.userModel);
        // } else {
        //   return const Center(
        //     child: Text('Unknow State'),
        //   );
        // }
      },
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