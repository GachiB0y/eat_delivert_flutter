import 'package:flutter/material.dart';

abstract class ScreenFactory {
  Widget makeUserMainScreen();
}

class MyApp extends StatelessWidget {
  final ScreenFactory screenFactory;
  const MyApp({super.key, required this.screenFactory});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:screenFactory.makeUserMainScreen(),
    );
  }
}
