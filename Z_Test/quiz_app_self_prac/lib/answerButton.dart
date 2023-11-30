import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton({super.key});
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ElevatedButton(onPressed: onPressed, child: child)],
    );
  }
}
