import 'dart:ffi';

import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  String text;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(text, textAlign: TextAlign.center));
  }
}
