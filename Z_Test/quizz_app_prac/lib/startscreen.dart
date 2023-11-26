import 'package:flutter/material.dart';

class startscreen extends StatelessWidget {
  startscreen(this.startquizz, {super.key});

  final void Function() startquizz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/qlogo.png',
            color: Colors.white,
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Quizz App Practice",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          OutlinedButton.icon(
              onPressed: startquizz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.arrow_right_alt),
              label: Text("Start Quizz")),
        ],
      ),
    );
  }
}
