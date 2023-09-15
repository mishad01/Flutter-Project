import 'package:flutter/material.dart';
import 'package:quizz_app/startScreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  State<quiz> createState() {
    return _quizzState();
  }
}

class _quizzState extends State<quiz> {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 112, 55, 179),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: StartScreen(),
        ),
      ),
    );
  }
}
