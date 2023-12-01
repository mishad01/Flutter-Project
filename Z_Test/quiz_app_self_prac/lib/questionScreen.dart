import 'package:flutter/material.dart';
import 'package:quiz_app_self_prac/answerButton.dart';
import 'package:quiz_app_self_prac/data/questions.dart';

class questionScreen extends StatefulWidget {
  questionScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  var questionIndex = 0;
  final currentquestion = questions[0];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentquestion.question,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          ...currentquestion.Answer.map((answer) {
            return answerButton(answerText: answer, onTap: () {});
          }),
        ],
      ),
    );
  }
}
