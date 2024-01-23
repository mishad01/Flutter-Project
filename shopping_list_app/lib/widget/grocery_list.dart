import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/model/groceryItems_model.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryList();
  }
}

class _GroceryList extends State<GroceryList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(groceryItems[index].name),
        leading: Container(
          height: 24,
          width: 24,
          color: groceryItems[index].category.color,
        ),
        trailing: Text(groceryItems[index].quantity.toString()),
      ),
    );
  }
}
