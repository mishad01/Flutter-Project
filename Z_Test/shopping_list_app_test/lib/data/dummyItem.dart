import 'package:shopping_list_app_test/data/categories_data.dart';
import 'package:shopping_list_app_test/model/categories_model.dart';
import 'package:shopping_list_app_test/model/groceryItems_model.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
