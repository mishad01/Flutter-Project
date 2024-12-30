import 'package:e_learning_app/view/auth/pin_verification/pin_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ELearningApp extends StatelessWidget {
  const ELearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        fillColor: Color(0xffFFFFFF),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xffFFFFFF),
          ),
        ),
      )),
      home: PinVerificationView(),
    );
  }
}
