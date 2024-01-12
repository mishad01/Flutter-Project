import 'package:flutter/material.dart';
import 'package:multiscreen_navigation/model/mealModel.dart';
import 'package:multiscreen_navigation/screens/categories_Screen.dart';
import 'package:multiscreen_navigation/screens/filterScreen.dart';
import 'package:multiscreen_navigation/screens/meals_Screen.dart';
import 'package:multiscreen_navigation/widgets/main_Drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
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
      setState(() {
        _favouriteMeal.remove(meal);
      });
      showInfoMessage("Meals is now longer a favourite. ");
    } else {
      _favouriteMeal.add(meal);
      showInfoMessage("Meals added to favourite.");
    }
  }

  void selectPage(int ind) {
    setState(() {
      _selectedPageIndex = ind;
    });
  }

  void _setScreen(String identifier) {
    if (identifier == 'Filters') {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => filterScreen(),
      ));
    } else {
      Navigator.pop(context);
    }
  }

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
        drawer: mainDrawer(onSelectScreen: _setScreen),
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
