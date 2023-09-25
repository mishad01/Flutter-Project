import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/resultscreen.dart';
import 'package:quizz_app/startScreen.dart';

class quizz extends StatefulWidget {
  quizz({super.key});
  @override
  State<quizz> createState() {
    return _quizz();
  }
}

class _quizz extends State<quizz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
        selectedAnswer = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = questionScreen(
        onSelectAnswer: choosenAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = resultScreen(
        choosenAnswer: [],
      );
    }
    return SizedBox(
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 90, 15, 219),
                  const Color.fromARGB(255, 123, 67, 219)
                ],
              ),
            ),
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
