import 'package:e_learning_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SignInOption extends StatelessWidget {
  const SignInOption({
    super.key,
    required this.logo,
    required this.title,
  });
  final String logo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Center(
              child: Image.network(
                logo,
                height: 20,
                width: 20,
              ),
            ),
          ),
          Text(
            "Continue with $title",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: AppColors.blackGray),
          ),
        ],
      ),
    );
  }
}
