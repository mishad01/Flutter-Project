import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton({required this.answerText, required this.onTap, super.key});
  void Function() onTap;
  String answerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ElevatedButton(onPressed: onTap, child: Text(answerText))],
    );
  }
}
