import 'package:flutter/material.dart';

class questionsSummary extends StatelessWidget {
  const questionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(
                ((data['question_index'] as int) + 1).toString()), //TypeCasting
            Column(
              children: [
                Text(data['question'] as String),
                SizedBox(
                  height: 5,
                ),
                Text(data['Selected Answer'] as String),
                Text(data['Correct_Answer'] as String),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
