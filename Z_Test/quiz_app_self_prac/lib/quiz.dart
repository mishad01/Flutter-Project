import 'package:flutter/material.dart';
import 'package:quiz_app_self_prac/questionScreen.dart';
import 'package:quiz_app_self_prac/startScreen.dart';

class quiz extends StatefulWidget {
  quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _quizz();
  }
}

class _quizz extends State<quiz> {
  var activeScreen = "start-screen";
  void switchScreeen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = startScreen(switchScreeen);
    if (activeScreen == "question-screen") {
      screenwidget = questionScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
          )),
          child: screenwidget,
        ),
      ),
    );
  }
}
