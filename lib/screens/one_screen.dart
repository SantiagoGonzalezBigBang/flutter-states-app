import 'package:flutter/material.dart';
import 'package:states_app/models/models.dart';
import 'package:states_app/services/services.dart';

class OneScreen extends StatelessWidget {
   
  const OneScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One Screen'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
          return snapshot.hasData 
            ? UserInformation(userModel: snapshot.data!)
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
          const ListTile(
            title: Text('Prefession 1:'),
          ),
          const ListTile(
            title: Text('Prefession 2:'),
          ),
          const ListTile(
            title: Text('Prefession 3:'),
          ),
        ],
      ),
    );
  }
}