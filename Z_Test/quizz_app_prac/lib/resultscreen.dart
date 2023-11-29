import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app_prac/Data/questions.dart';
import 'package:quizz_app_prac/question_summary.dart';

class resultScreen extends StatelessWidget {
  resultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'questions': questions[i].question,
        'correct-answer': questions[i].answer[0],
        'user-answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = questions.length;
    // final numOfcurrentAnswer = summaryData.where((element) {
    //   return
    // })
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Answerd this number of Question out of $totalQuestion",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.center,
                child: questionSummary(summaryData)),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.rotate_right),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: Text("Restart Quizz"),
            ),
          ],
        ),
      ),
    );
  }
}
