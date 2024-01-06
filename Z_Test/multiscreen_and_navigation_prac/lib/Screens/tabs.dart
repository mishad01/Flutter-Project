import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/Screens/categories.dart';
import 'package:multiscreen_and_navigation_prac/Screens/mealsScreen.dart';
import 'package:multiscreen_and_navigation_prac/model/mealModel.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];

  void toggleMealFavouriteStatus(Meal meal) {
    final bool isExisting = favouriteMeals.contains(meal);

    if (isExisting) {
      favouriteMeals.remove(meal);
    } else {
      favouriteMeals.add(meal);
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = categoriesScreen(
      onToggleFavourite: toggleMealFavouriteStatus,
    );
    var activePageTitile = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: [],
        onToggleFavourite: toggleMealFavouriteStatus,
      );
      activePageTitile = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitile),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite")
        ],
      ),
    );
  }
}
