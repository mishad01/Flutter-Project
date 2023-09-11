import 'package:flutter/material.dart';
import 'package:roll_dice_app/GradientContainer.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: gradientContainer(
          colors: const [Colors.blueGrey, Colors.brown],
        ),
      ),
    ),
  );
}
