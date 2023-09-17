import 'package:flutter/material.dart';
import 'package:quizz_app/answerButton.dart';
import 'package:quizz_app/data/questions.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});
  @override
  State<questionScreen> createState() {
    return _questionScreen();
  }
}

class _questionScreenn extends State<questionScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.txt,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          answerButton(
            txt: currentQuestion.answers[0],
            onTap: () {},
          ),
          const SizedBox(height: 20),
          answerButton(
            txt: currentQuestion.answers[1],
            onTap: () {},
          ),
          const SizedBox(height: 20),
          answerButton(
            txt: currentQuestion.answers[2],
            onTap: () {},
          ),
          const SizedBox(height: 20),
          answerButton(
            txt: currentQuestion.answers[3],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
