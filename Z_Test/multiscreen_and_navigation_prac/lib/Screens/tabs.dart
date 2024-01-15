import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/Screens/categories.dart';
import 'package:multiscreen_and_navigation_prac/Screens/filters.dart';
import 'package:multiscreen_and_navigation_prac/Screens/mealsScreen.dart';
import 'package:multiscreen_and_navigation_prac/data/dummyData.dart';
import 'package:multiscreen_and_navigation_prac/model/mealModel.dart';
import 'package:multiscreen_and_navigation_prac/providers/meals_provider.dart';
import 'package:multiscreen_and_navigation_prac/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'package:';

const KInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];

  Map<Filter, bool> _selectedFilter = KInitialFilters;

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(currentFilters: _selectedFilter),
        ),
      );
      setState(() {
        _selectedFilter = result ?? KInitialFilters;
      });
    }
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

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where(
      (meal) {
        if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_selectedFilter[Filter.lactosFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
    Widget activePage = categoriesScreen(
      onToggleFavourite: toggleMealFavouriteStatus,
      availableMeals: availableMeals,
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
      drawer: MainDrawer(onSelectScreen: setScreen),
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
