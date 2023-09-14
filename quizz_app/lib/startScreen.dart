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
        OutlinedButton.icon(
          //Icon can be used in some other places to.But if you wanna use clickable we go for this
          onPressed: () {},
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          // child: Text('Start Quizz'), //Here after using OutlinedButton.icon the child isn't child anymore.It bocomes level
          icon: Icon(Icons.arrow_right_alt),
          label: Text('Start Quizz'),
        ),
      ],
    ));
  }
}
