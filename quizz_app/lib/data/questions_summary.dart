import 'package:flutter/material.dart';

class questionsSummary extends StatelessWidget {
  const questionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1)
                    .toString()), //TypeCasting
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      // Text(data['user_Answer'] as String),
                      // Text(data['correct_Answer'] as String), //correct_Answer HERE THIS IS WRONG AND WE WILL GET ERROR BECAUSE IN REULT SCREEN WE GAVE correct_answer THE A was small letter
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
