import 'package:flutter/material.dart';
import 'package:multiscreen_navigation/model/mealModel.dart';
import 'package:multiscreen_navigation/screens/categories_Screen.dart';
import 'package:multiscreen_navigation/screens/meals_Screen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeal = [];

  void _toggleMealFvouriteStatus(Meal meal) {
    final isExisting = _favouriteMeal.contains(meal);
    if (isExisting) {
      _favouriteMeal.remove(meal);
    } else {
      _favouriteMeal.add(meal);
    }
  }

  void selectPage(int ind) {
    setState(() {
      _selectedPageIndex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = categoriesScreen(
      onToggleFavourite: _toggleMealFvouriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = mealsScreen(
        meals: _favouriteMeal,
        onToggleFavourite: _toggleMealFvouriteStatus,
      );
      activePageTitle = 'Your Favourite';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: _selectedPageIndex,
          //showSelectedLabels: false,
          //showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Categories',
            ),
          ],
        ));
  }
}