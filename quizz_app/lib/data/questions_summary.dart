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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            return Row(
              children: [
                Text((((data['question_index'] as int) + 1).toString())),
                //TypeCasting
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        (data['question'] as String),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Text(data['user_Answer'] as String),
                      // Text(data['correct_Answer'] as String), //correct_Answer HERE THIS IS WRONG AND WE WILL GET ERROR BECAUSE IN REULT SCREEN WE GAVE correct_answer THE A was small letter
                      Text(
                        (data['user_answer'] as String),
                        style: TextStyle(
                          color: Color.fromARGB(255, 217, 72, 253),
                        ),
                      ),
                      Text(
                        (data['correct_answer'] as String),
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 168, 255)),
                      ),
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
