import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/categories.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  @override
  Widget build(BuildContext context) {
    return categoriesScreen();
  }
}
