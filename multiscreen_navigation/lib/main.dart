import 'package:flutter/material.dart';
import 'package:multiscreen_navigation/model/meals_Screen.dart';
import 'package:multiscreen_navigation/screens/categories_Screen.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color.fromARGB(255, 131, 57, 0),
    ));
void main() {
  runApp(
    MainScreen(),
  );
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: mealsScreen(title: "Test", meals: []),
    );
  }
}
