import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app_test/data/dummyItem.dart';
import 'package:shopping_list_app_test/model/categories_model.dart';
import 'package:shopping_list_app_test/model/groceryItems_model.dart';
import 'package:shopping_list_app_test/widget/newItem.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryList();
  }
}

class _GroceryList extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-prep-761b5-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);

    final Map<String, Map<String, dynamic>> listData =
        json.decode(response.body);

    final List<GroceryItem> _loaddedItem = [];

    // for (final item in listData.entries) {
    //   final category = Categories
    //   _loaddedItem.add(GroceryItem(
    //       id: item.key,
    //       name: item.value['name'],
    //       quantity: item.value['quantiy'],
    //       category: Category(title, color)));
    // }
  }

  void addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => NewItem(),
      ),
    );

    _loadItems();
    // if (newItem == null) {
    //   return;
    // }
    // setState(() {
    //   _groceryItems.add(newItem);
    // });
  }

  void removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
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
