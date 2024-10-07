import 'package:bmi_calculator_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
