import 'package:bmi_calculator_app/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class GenderToggleButton extends StatefulWidget {
  @override
  _GenderToggleButtonState createState() => _GenderToggleButtonState();
}

class _GenderToggleButtonState extends State<GenderToggleButton> {
  bool isMaleSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: 333,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Male",
            style: TextStyle(
              color: isMaleSelected ? AppColor.themeColor : Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                isMaleSelected = !isMaleSelected;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 41,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isMaleSelected
                    ? AppColor.themeColor.withOpacity(0.2)
                    : AppColor.themeColor.withOpacity(0.2),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    left: isMaleSelected
                        ? 0
                        : 95, // Only change the left property
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColor.themeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            "Female",
            style: TextStyle(
              color: isMaleSelected ? Colors.grey : AppColor.themeColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
