import 'package:flutter/material.dart';
import 'package:shopping_list_app_test/data/dummyItem.dart';
import 'package:shopping_list_app_test/model/groceryItems_model.dart';
import 'package:shopping_list_app_test/widget/newItem.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryList();
  }
}

class _GroceryList extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_groceryItems[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: _groceryItems[index].category.color,
          ),
          trailing: Text(
            _groceryItems[index].quantity.toString(),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: addItem, icon: Icon(Icons.add))],
      ),
      body: content,
      // ListView.builder(
      //   itemCount: _groceryItems.length,
      //   itemBuilder: (context, index) => ListTile(
      //     title: Text(_groceryItems[index].name),
      //     leading: Container(
      //       width: 24,
      //       height: 24,
      //       color: _groceryItems[index].category.color,
      //     ),
      //     trailing: Text(_groceryItems[index].quantity.toString()),
      //   ),
      // ),
    );
  }
}
