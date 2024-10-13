import 'package:bmi_calculator_app/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.bmiRes,
  });
  final double bmiRes;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f3ff),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "BMI CALCULATOR",
                  style: TextStyle(color: Color(0xff081854), fontSize: 17.6),
                ),
                const SizedBox(height: 20),
                Text(
                  "Body Mass Index",
                  style: TextStyle(color: AppColor.themeColor, fontSize: 27.78),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 333,
                  height: 416,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "BMI Results",
                        style: TextStyle(color: Colors.black, fontSize: 27.78),
                      ),
                      Text(
                        '${widget.bmiRes.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: AppColor.themeColor),
                      ),
                      const SizedBox(height: 20),
                      _buildBMICategory(), // New BMI category widget
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(63),
                        ),
                        minimumSize: const Size(332, 73),
                        backgroundColor: AppColor.themeColor),
                    child: const Text(
                      "Save the result",
                      style: TextStyle(fontSize: 17.6, color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to display BMI categories
  Widget _buildBMICategory() {
    return Column(
      children: const [
        Text(
          "NORMAL BMI",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Underweight: BMI less than 18.5\n"
          "Normal weight: BMI 18.5 to 24.9\n"
          "Overweight: BMI 25 to 29.9\n"
          "Obesity: 30 to 40",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
