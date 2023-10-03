import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/data/questions_summary.dart';

class resultScreen extends StatelessWidget {
  resultScreen(
      {super.key, required this.choosenAnswer, required this.onrestart});
  final List<String> choosenAnswer;
  void Function() onrestart;

  //Here object allows all kind of values
  List<Map<String, Object>> getsummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      //This is a dart syntax for creating a map value ({})
      summary.add({
        'question_index': i,
        'question': questions[i].txt,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final SummaryData = getsummaryData();
    final numTotalQuestions = questions.length;
    final numofCorrectQestions = SummaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        //We are using container to get mergin option
        margin: const EdgeInsets.all(
            20), //Using this we can rezie the answet botton box size
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Answered $numofCorrectQestions correctly out of $numTotalQuestions questions',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            //questionsSummary(getsummaryData()),
            questionsSummary(SummaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onrestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: Text('Restart Quizz'),
              icon: Icon(Icons.rotate_right),
            ),
          ],
        ),
      ),
    );
  }
}
