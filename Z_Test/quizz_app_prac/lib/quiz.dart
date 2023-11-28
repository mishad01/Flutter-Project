import 'package:flutter/material.dart';
import 'package:quizz_app_prac/Data/questions.dart';
import 'package:quizz_app_prac/questionscreen.dart';
import 'package:quizz_app_prac/startscreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _quiz();
  }
}

class _quiz extends State<quiz> {
  var activeScreen = 'start-screen';
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = startscreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswer = [];

  void choosenAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'start-screen';
        selectedAnswer = [];
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = startscreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = questionScreen(
        onselectAnswer: choosenAnswer,
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
