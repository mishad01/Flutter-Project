import 'package:chat_mate/ui/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: _lightThemeData(),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(

        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.4),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.infinity),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
