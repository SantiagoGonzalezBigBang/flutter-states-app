import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:states_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'States App',
      initialRoute: 'one',      
      // routes: {
      //   'one' :(context) => const OneScreen(),
      //   'two' :(context) => const TwoScreen(),
      // },
      getPages: [
        GetPage(name: '/one', page: () => const OneScreen()),
        GetPage(name: '/two', page: () => const TwoScreen()),
      ],
    );
  }
}