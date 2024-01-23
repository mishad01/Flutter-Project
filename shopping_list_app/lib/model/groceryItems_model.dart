import 'package:shopping_list_app/model/categories_model.dart';

class GroceryItem {
  GroceryItem(this.id, this.name, this.quantity, this.Categories);
  final String id;
  final String name;
  final int quantity;
  final Categories;
}
