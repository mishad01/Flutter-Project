import 'package:flutter/material.dart';

class summaryItem extends StatelessWidget {
  summaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;
  @override
  Widget build(BuildContext context) {
    final bool isCorrect;
    isCorrect = itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 30,
            height: 32,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0), // Adjust the padding as needed
            decoration: BoxDecoration(
              color: isCorrect
                  ? Colors.green
                  : const Color.fromARGB(255, 238, 13, 13), // Background color
              borderRadius: BorderRadius.circular(
                  100.0), // Adjust the radius for roundness
            ),
            child:
                Text((((itemData['question_index'] as int) + 1).toString()))),
        const SizedBox(
          width: 20,
        ),
        //TypeCasting
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (itemData['question'] as String),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                (itemData['user_answer'] as String),
                style: const TextStyle(
                  color: Color.fromARGB(255, 217, 72, 253),
                ),
              ),
              Text(
                (itemData['correct_answer'] as String),
                style:
                    const TextStyle(color: Color.fromARGB(255, 102, 168, 255)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
