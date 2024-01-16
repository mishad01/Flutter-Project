import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_and_navigation_prac/model/mealModel.dart';

// Define a Riverpod StateNotifier class to manage a list of favorite meals

class FavouriteMealsNotfier extends StateNotifier<List<Meal>> {
  // Define a Riverpod StateNotifier class to manage a list of favorite meals
  FavouriteMealsNotfier() : super([]);

  // Method to toggle the favorite status of a meal

  void ToggleMealFavouriteStatus(Meal meal) {
    // Check if the meal is already in the list of favorites
    final mealsFavourite = state.contains(meal);

    // If the meal is already a favorite, remove it from the list
    if (mealsFavourite) {
      state = state.where((mealnew) => mealnew.id != meal.id).toList();
    } else {
      state = [
        ...state,
        meal
      ]; //... state, it will pull out all the element from the list and add the element in new list ,meal is a new element
    }
  }
}

// Define a StateNotifierProvider for managing the state of favorite meals
final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealsNotfier, List<Meal>>((ref) {
  // Create and return an instance of FavouriteMealsNotfier as the state notifier
  return FavouriteMealsNotfier();
});
