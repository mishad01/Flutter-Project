import 'package:flutter/widgets.dart';
import 'package:quizz_app_prac/Data/questions.dart';

class questionSummary extends StatelessWidget {
  questionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data['question-index'] as int) + 1).toString()),
            Expanded(
              child: Column(
                children: [
                  // Text(data['questions'] as String),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Text(
                  //   (data['user-answer'] as String),
                  //   style: const TextStyle(
                  //     color: Color.fromARGB(255, 217, 72, 253),
                  //   ),
                  // ),
                  // Text(
                  //   (data['correct-answer'] as String),
                  //   style:
                  //       const TextStyle(color: Color.fromARGB(255, 0, 218, 36)),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
