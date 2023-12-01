import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton({required this.answerText, required this.onTap, super.key});
  void Function() onTap;
  String answerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  //Using this we can mig the button small and big
                  vertical: 10,
                  horizontal:
                      20), //It alwos to set seperate padding for horizontal and vertical pedding mainly spacing
              backgroundColor: Color.fromARGB(255, 34, 15, 85),
              foregroundColor: Colors.white,
              // maximumSize: Size(100, 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            ),
            child: Text(answerText))
      ],
    );
  }
}
