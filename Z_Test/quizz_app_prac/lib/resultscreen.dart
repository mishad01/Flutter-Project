import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  resultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Answerd this number of Question out of this",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
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
