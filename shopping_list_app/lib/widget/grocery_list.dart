import 'package:flutter/material.dart';
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
  final List<GroceryItem> _groceryItem = [];

  void addItem() async {
    final newItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
        builder: (context) => NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItem.add(newItem);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_groceryItem[index].name),
          leading: Container(
            height: 24,
            width: 24,
            color: _groceryItem[index].category.color,
          ),
          trailing: Text(_groceryItem[index].quantity.toString()),
        ),
      ),
    );
  }
}
