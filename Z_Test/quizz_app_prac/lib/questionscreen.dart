import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app_prac/Data/questions.dart';
import 'package:quizz_app_prac/answerButton.dart';

class questionScreen extends StatefulWidget {
  questionScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            ...currentQuestion.answer.map(
              (answer) {
                return answerButton(text: answer, onTap: () {});
              },
            ),
            // ElevatedButton(
            //     onPressed: () {}, child: Text(currentQuestion.answer[0])),
            // ElevatedButton(onPressed: () {}, child: Text("Answer2")),
          ],
        ),
      ),
    );
  }
}
