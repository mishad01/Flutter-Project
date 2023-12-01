import 'package:flutter/material.dart';
import 'package:quiz_app_self_prac/data/questions.dart';
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
  List<String> selectedAnwser = [];

  void switchScreeen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void choosenAnswe(String text) {
    selectedAnwser.add(text);
    if (selectedAnwser.length == questions.length) {
      setState(() {
        selectedAnwser = [];
        activeScreen = "start-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = startScreen(switchScreeen);
    if (activeScreen == "question-screen") {
      screenwidget = questionScreen(
        onSelectedAnswer: choosenAnswe,
      );
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
