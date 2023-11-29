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
            Text(
              ((data['question'] as int) + 1).toString(),
            ),
          ],
        );
      }).toList(),
    );
  }
}
