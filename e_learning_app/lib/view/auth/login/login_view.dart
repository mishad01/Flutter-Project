import 'package:e_learning_app/resources/app_colors.dart';
import 'package:e_learning_app/resources/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(AssetsPath.logo)),
              Text(
                "Let’s Sign In.!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "Login to Your Account to Continue your Courses",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.blackGray,
                ),
              ),
              TextFormField(),
              SizedBox(height: 10),
              TextFormField(),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(LoginView());
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: AppColors.themeColor,
                    foregroundColor: Colors.white),
                child: Row(
                  children: [
                    Expanded(child: Center(child: Text("Sign In"))),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
