import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app_prac/Data/questions.dart';
import 'package:quizz_app_prac/answerButton.dart';

class questionScreen extends StatefulWidget {
  questionScreen({required this.onselectAnswer, super.key});

  final void Function(String answer) onselectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onselectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ...currentQuestion.getShuffledAnswer().map(
              (answer) {
                return answerButton(
                    text: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
