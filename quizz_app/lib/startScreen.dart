import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz,
      {super.key}); //Her efunction is special type in flutter

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 100,
          //color: Colors.black, //We can change the color of our logo using this
          color: const Color.fromARGB(
              148, 255, 255, 255), //Using this we can create opacity
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
          onPressed: () {
            startQuiz(); //We are passing a pointer at anonymous function
          },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          // child: Text('Start Quizz'), //Here after using OutlinedButton.icon the child isn't child anymore.It bocomes level
          icon: Icon(Icons.arrow_right_alt),
          label: Text('Start Quizz'),
        ),
      ],
    ));
  }
}
