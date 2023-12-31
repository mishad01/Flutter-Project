import 'package:flutter/material.dart';
import 'package:quizz_app_prac/Data/questions.dart';
import 'package:quizz_app_prac/questionscreen.dart';
import 'package:quizz_app_prac/resultscreen.dart';
import 'package:quizz_app_prac/startscreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _quiz();
  }
}

class _quiz extends State<quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = startscreen(switchScreen);
  //   super.initState();
  // }

  List<String> answerd = [];

  void choosenAnswer(String answer) {
    answerd.add(answer);
    setState(() {
      if (answerd.length == questions.length) {
        activeScreen = 'result-screen';
        //answerd = [];
      }
    });
  }

  var activeScreen = 'start-screen';

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
        selectedAnswer: choosenAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = resultScreen(
        chosenAnswers: answerd,
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
