import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/screens/screens.dart';
import 'package:states_app/services/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'States App',
        initialRoute: 'one',
        routes: {
          'one' :(context) => const OneScreen(),
          'two' :(context) => const TwoScreen(),
        },
      ),
    );
  }
}