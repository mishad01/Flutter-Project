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

class _questionScreen extends State<questionScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        //Padding is the internal spacing  between content and the borders
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //The box stretched out the full screen
        children: [
          Text(
            currentQuestion.txt,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          ...currentQuestion.answers.map((item) {
            return answerButton(txt: item, onTap: () {});
          }),
        ],
      ),
    );
  }
}
