import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';

class resultScreen extends StatelessWidget {
  resultScreen({super.key, required this.choosenAnswer});
  final List<String> choosenAnswer;

  //Here object allows all kind of values
  List<Map<String, Object>> getsummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      //This is a dart syntax for creating a map value ({})
      summary.add({
        'question_index': i,
        'question': questions[i].txt,
        'correct-answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        //We are using container to get mergin option
        margin: const EdgeInsets.all(
            20), //Using this we can rezie the answet botton box size
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your Anwered X out of Y questions correctly'),
            const SizedBox(
              height: 30,
            ),
            const Text('List of answer and questions'),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Restart Quizz'),
            ),
          ],
        ),
      ),
    );
  }
}
