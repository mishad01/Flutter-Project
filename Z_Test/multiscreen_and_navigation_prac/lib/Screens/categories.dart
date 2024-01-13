//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/Screens/mealsScreen.dart';
import 'package:multiscreen_and_navigation_prac/data/dummyData.dart';
import 'package:multiscreen_and_navigation_prac/model/categoryModel.dart';
import 'package:multiscreen_and_navigation_prac/model/mealModel.dart';
import 'package:multiscreen_and_navigation_prac/widget/Category_Grid_Item.dart';

class categoriesScreen extends StatelessWidget {
  const categoriesScreen({
    super.key,
    required this.onToggleFavourite,
    required this.availableMeals,
  });

  //This is a method named '_selectCategory' that takes a 'BuildContext' as a parameter.
  // void _selectCategory(BuildContext context) {
  //   // Using the 'Navigator' to navigate to a new screen.
  //   Navigator.push(
  //     // The 'context' is necessary for navigation, indicating the current build context.
  //     context,
  //     // Creating a new MaterialPageRoute for the navigation.
  //     MaterialPageRoute(
  //       // The 'builder' property is a function that returns the widget for the new screen.
  //       builder: (context) => MealsScreen(
  //         // Creating an instance of the 'MealsScreen' widget with specific parameters.
  //         title:
  //             "Some title", // Setting the title property of the 'MealsScreen'.
  //         meals: [], // Setting the meals property of the 'MealsScreen'.
  //       ),
  //     ),
  //   );
  // }
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //Here context is not availbale globally that's why we have to use "BuildContext context". So that we can pass context as a value to push
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // Create a GridView widget, which is a scrollable grid of widgets.
        GridView(
            padding: EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // Set the number of items in each row (cross-axis) to 2
                // Define the width-to-height ratio of each grid item to be 3:2
                // Add spacing (20 pixels) between items in the same row
                // Add spacing (20 pixels) between rows in the grid
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context,
                      category); //We can set o rpass the category as a value to select catagory
                }),
        ]);
  }
}
