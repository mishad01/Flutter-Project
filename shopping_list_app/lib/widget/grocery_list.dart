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

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItem.remove(item);
    });
  }

  Widget build(BuildContext context) {
    Widget content = Center(
        child: Text(
      'No Items added yet',
      style: TextStyle(fontSize: 15),
    ));

    if (_groceryItem.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItem[index]);
          },
          key: ValueKey(_groceryItem[index].id),
          child: ListTile(
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

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: addItem, icon: Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
