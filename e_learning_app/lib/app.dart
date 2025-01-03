import 'package:e_learning_app/resources/app_colors.dart';
import 'package:e_learning_app/view/auth/fill_profile/fill_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ELearningApp extends StatelessWidget {
  const ELearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
          theme: _buildThemeData(), home: const FillProfileView()),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.white,
        filled: true,
        labelStyle:
            GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.white,
          ),
        ),
      ),
      fontFamily: GoogleFonts.jost().fontFamily,
    );
  }
}
