import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  startScreen(this.startButton, {super.key});

  void Function() startButton;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/qlogo.png',
            color: Colors.white,
            width: 100,
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            "Quizz App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
              onPressed: startButton,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              child: Text("Start")),
        ],
      ),
    );
  }
}
