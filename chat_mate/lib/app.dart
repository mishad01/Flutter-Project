import 'package:chat_mate/ui/auth/splash_screen.dart';
import 'package:flutter/material.dart';

class ChatMate extends StatelessWidget {
  const ChatMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _lightThemeData(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
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
