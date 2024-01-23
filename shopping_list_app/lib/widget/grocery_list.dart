import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/model/groceryItems_model.dart';
import 'package:shopping_list_app/widget/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryList();
  }
}

class _GroceryList extends State<GroceryList> {
  void addItem() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewItem(),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
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
      ),
    );
  }
}
