import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      theme: _ThemeData(),
    );
  }

  ThemeData _ThemeData() {
    return ThemeData(
      textTheme: TextTheme(
          bodyMedium: GoogleFonts.nunitoSans(
        color: Colors.white,
        fontSize: 15,
      )),
      scaffoldBackgroundColor: const Color(0xffF9F9F9),
    );
  }
}
