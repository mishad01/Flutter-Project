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

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void toggleMealFavouriteStatus(Meal meal) {
    final bool isExisting = favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        favouriteMeals.remove(meal);
      });
      showInfoMessage("Meal is no longer a favourite");
    } else {
      favouriteMeals.add(meal);
      showInfoMessage("Marked as favourite");
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
        meals: favouriteMeals,
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
