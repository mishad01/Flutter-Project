import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
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

  final List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswer.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = questionScreen(
        onSelectAnswer: choosenAnswer,
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
