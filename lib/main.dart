import 'package:flutter/material.dart';
import 'package:states_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'States App',
      initialRoute: 'one',
      routes: {
        'one' :(context) => const OneScreen(),
        'two' :(context) => const TwoScreen(),
      },
    );
  }
}