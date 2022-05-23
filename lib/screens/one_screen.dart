import 'package:flutter/material.dart';

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
      body: const UserInformation(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'General',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Name:'),
          ),
          ListTile(
            title: Text('Age:'),
          ),
          Text(
            'Professions',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Prefession 1:'),
          ),
          ListTile(
            title: Text('Prefession 2:'),
          ),
          ListTile(
            title: Text('Prefession 3:'),
          ),
        ],
      ),
    );
  }
}