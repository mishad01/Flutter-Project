import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  answerButton({
    super.key,
    required this.txt,
    required this.onTap,
  });
  String txt;
  void Function() onTap; //It will work on pressed on the elevatedbutton
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            //Using this we can mig the button small and big
            vertical: 10,
            horizontal:
                40), //It alwos to set seperate padding for horizontal and vertical pedding mainly spacing
        backgroundColor: Color.fromARGB(255, 34, 15, 85),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(txt),
    );
  }
}
