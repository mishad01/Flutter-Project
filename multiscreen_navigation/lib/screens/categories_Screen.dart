import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:multiscreen_navigation/data/dummy_data.dart';
import 'package:multiscreen_navigation/model/categories_Model.dart';
import 'package:multiscreen_navigation/model/mealModel.dart';
import 'package:multiscreen_navigation/screens/meals_Screen.dart';
import 'package:multiscreen_navigation/widgets/category_grid.dart';

class categoriesScreen extends StatelessWidget {
  categoriesScreen({
    super.key,
    required this.onToggleFavourite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  void selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((element) => element.categories.contains(category.id))
        .toList(); //After click if we wanna go on a specific screen we use this

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => mealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  } // For going to the next Page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              categoryGridItem(
                category: category,
                onSelectCategory: () {
                  selectCategory(context, category);
                },
              ),
          ],
        ),
      ),
    );
  }
}
