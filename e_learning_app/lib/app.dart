import 'package:e_learning_app/view/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';

class ELearningApp extends StatelessWidget {
  const ELearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoarding(),
    );
  }
}
