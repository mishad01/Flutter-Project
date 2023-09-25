import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  resultScreen({super.key});
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
            Text('Your Anwered X out of Y questions correctly'),
            SizedBox(
              height: 30,
            ),
            Text('List of answer and questions'),
            SizedBox(
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
