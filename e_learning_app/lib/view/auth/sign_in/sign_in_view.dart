import 'package:e_learning_app/resources/app_colors.dart';
import 'package:e_learning_app/resources/assets_path.dart';
import 'package:e_learning_app/view/auth/login/login_view.dart';
import 'package:e_learning_app/view/auth/sign_in/widget/sign_in_option.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Lets you in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                width: 232,
                height: 120,
                child: Column(
                  children: [
                    SignInOption(logo: AssetsPath.google, title: "Google"),
                    SignInOption(logo: AssetsPath.apple, title: "Apple"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "( Or )",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: AppColors.blackGray,
                ),
              ),
              SizedBox(height: 20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sign In with Your Account"),
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
              SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: AppColors.themeColor),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
