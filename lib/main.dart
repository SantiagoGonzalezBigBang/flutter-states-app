import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/screens/screens.dart';
import 'package:states_app/bloc/user/user_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc())
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