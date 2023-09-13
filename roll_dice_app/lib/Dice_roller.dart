import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeImage = 'assets/images/dice-1.png';
  void rolldice() {
    setState(() {
      activeImage = 'assets/images/dice-4.png';
    });
    //activeImage = 'assets/images/dice-4.png';
  }

  Widget build(context) {
    return Column(
      //Its by default takes all the vartical space
      //So if wanna make it vartically centered we use this
      mainAxisSize: MainAxisSize.min, //using this we centered it
      children: [
        //Here it will take a list of widget
        Image.asset(
          activeImage,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rolldice,
          style: TextButton.styleFrom(
            //padding: const EdgeInsets.only(
            //top: 20), //Padding is mainly giving space
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 25),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
