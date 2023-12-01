import 'package:flutter/material.dart';
import 'package:quiz_app_self_prac/answerButton.dart';
import 'package:quiz_app_self_prac/data/questions.dart';

class questionScreen extends StatefulWidget {
  questionScreen({required this.onSelectedAnswer, super.key});

  void Function(String textt) onSelectedAnswer;
  @override
  State<StatefulWidget> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  var questionIndex = 0;

  void answeredQuestion(String text) {
    widget.onSelectedAnswer(text);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentquestion.question,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ...currentquestion.Answer.map((answer) {
              return answerButton(
                  answerText: answer,
                  onTap: () {
                    answeredQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
