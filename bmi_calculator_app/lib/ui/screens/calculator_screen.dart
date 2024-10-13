import 'package:bmi_calculator_app/ui/screens/result_screen.dart';
import 'package:bmi_calculator_app/ui/utility/app_colors.dart';
import 'package:bmi_calculator_app/ui/widgets/gender_widget.dart';
import 'package:bmi_calculator_app/ui/widgets/heigh_widget.dart';
import 'package:bmi_calculator_app/ui/widgets/value_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int age = 0;
  int weight = 0;
  int height = 0;

  void _onAgeChanged(int newVal) {
    age = newVal;
    setState(() {});
  }

  void _onWeightChanged(int newVal) {
    weight = newVal;
    setState(() {});
  }

  void _onHeightChanged(int newVal) {
    height = newVal;
    setState(() {});
  }

  double bmiRes = 0;
  double _calculateBMI() {
    double heightInCm = (height / 100) * (height / 100);
    return weight / heightInCm;
  }

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
                  ValueCounter(
                      title: "Age", value: 0, onValueChanged: _onAgeChanged),
                  ValueCounter(
                      title: 'Weight (KG)',
                      value: 0,
                      onValueChanged: _onWeightChanged),
                ],
              ),
              SizedBox(height: 10),
              HeightWidget(onValueChanged: _onHeightChanged),
              SizedBox(height: 10),
              GenderToggleButton(),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    bmiRes = _calculateBMI();
                    Get.to(() => ResultScreen(
                          bmiRes: bmiRes,
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(63),
                      ),
                      minimumSize: const Size(332, 73),
                      backgroundColor: AppColor.themeColor),
                  child: const Text(
                    "Calculate BMI",
                    style: TextStyle(fontSize: 17.6, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
