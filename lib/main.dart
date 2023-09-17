import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/screens/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const GameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
