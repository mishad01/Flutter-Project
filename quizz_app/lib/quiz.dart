import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/startScreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  State<quiz> createState() {
    return _quizzState();
  }
}

class _quizzState extends State<quiz> {
  //var activeScreen =StartScreen(); //we can store widgets in variables because widgets are objects and objects are regular number in dart
  Widget activeScreen = const StartScreen();
  void switchScreen() {
    setState(() {
      activeScreen = const questionScreen();
    });
  }

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
          child: activeScreen,
        ),
      ),
    );
  }
}
