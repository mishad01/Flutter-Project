import 'package:bmi_calculator_app/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ValueCounter extends StatefulWidget {
  const ValueCounter({
    super.key,
    required this.title,
    required this.value,
    required this.onValueChanged,
  });
  final String title;
  final int value;
  final Function(int) onValueChanged;

  @override
  State<ValueCounter> createState() => _ValueCounterState();
}

class _ValueCounterState extends State<ValueCounter> {
  late int val = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    val = widget.value;
  }

  void increment() {
    val++;
    widget.onValueChanged(val);
    setState(() {});
  }

  void decrement() {
    val--;
    widget.onValueChanged(val);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 17.6,
            ),
          ),
          Text(
            '$val',
            style: TextStyle(
                fontSize: 57.39,
                fontWeight: FontWeight.bold,
                color: AppColor.themeColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: decrement,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff081854),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: const Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: increment,
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff081854),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Text(
                    '+',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
