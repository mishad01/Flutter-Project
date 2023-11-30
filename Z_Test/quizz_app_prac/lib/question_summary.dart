import 'package:flutter/widgets.dart';
import 'package:quizz_app_prac/Data/questions.dart';

class questionSummary extends StatelessWidget {
  questionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrect;
            isCorrect = data['user_answer'] == data['correct_answer'];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 30,
                    height: 32,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? const Color.fromARGB(255, 85, 245, 91)
                          : Color.fromARGB(
                              255, 255, 69, 140), // Background color
                      borderRadius: BorderRadius.circular(
                          300.0), // Adjust the radius for roundness
                    ),
                    child:
                        Text(((data['question-index'] as int) + 1).toString())),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data['questions'] as String,
                        //textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (data['user-answer'] as String),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 217, 72, 253),
                        ),
                      ),
                      Text(
                        (data['correct-answer'] as String),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 218, 36)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
