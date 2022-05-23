import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget {
   
  const TwoScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text(
                'Set User',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text(
                'Change Age',
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