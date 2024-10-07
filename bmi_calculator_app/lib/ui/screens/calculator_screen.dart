import 'package:bmi_calculator_app/ui/widgets/value_counter.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f3ff),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "BMI CALCULATOR",
                style: TextStyle(color: Color(0xff081854), fontSize: 17.6),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ValueCounter(title: "Age"),
                  ValueCounter(title: 'Weight (KG)'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
