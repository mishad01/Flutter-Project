import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/model/mealModel.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;
  //void
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ,
    );
  }
}
