import 'package:flutter/material.dart';
import 'package:roll_dice_app/Dice_roller.dart';

var a = Alignment.topCenter;
var b = Alignment.bottomCenter;

// ignore: camel_case_types
class gradientContainer extends StatelessWidget {
  gradientContainer({super.key, required this.colors});
  List<Color> colors;
  void rolldice() {}
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Color.fromARGB(255, 66, 60, 60), Colors.cyan],
          begin: a,
          end: b,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
