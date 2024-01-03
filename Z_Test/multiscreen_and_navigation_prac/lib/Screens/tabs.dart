import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/Screens/categories.dart';
import 'package:multiscreen_and_navigation_prac/Screens/mealsScreen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabsScreen> {
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const categoriesScreen();
    var activePageTitile = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(meals: []);
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
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.star), label: "Favourite")
        ],
      ),
    );
  }
}
