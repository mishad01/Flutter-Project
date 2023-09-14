import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 100,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Learning Flutter Quizz App',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: Text('Start Quizz'))
      ],
    ));
  }
}
