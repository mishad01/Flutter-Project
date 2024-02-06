import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/model/groceryItems_model.dart';
import 'package:shopping_list_app/widget/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryList();
  }
}

class _GroceryList extends State<GroceryList> {
  List<GroceryItem> _groceryItem = [];

  //var _isLoading = true;
  // late = tells dart that we dont habe any inital value for loaded items  but we will have a value before its being used the first time
  late Future<List<GroceryItem>> _loadedItems;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        'flutter-prep-761b5-default-rtdb.firebaseio.com', 'shopping-list.json');

    final response = await http.get(url);

    //throw Exception('An error occurred!');

    // try {
    //final response = await http.get(url);

    if (response.statusCode >= 400) {
      // setState(() {
      //   _error = 'Failed to fetch data. Please try again later.';
      // });
      throw Exception('Failed to fetch data. Please try again later');
    }

    if (response.body == 'null') {
      // setState(() {
      //   _isLoading = false;
      // });
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    return loadedItems;
    //   setState(() {
    //     _groceryItem = loadedItems;
    //     _isLoading = false;
    //   });
    // }
    // catch (error) {
    //   setState(() {
    //     _error = 'Something went wrong! Please try again later.';
    //   });
    // }
  }

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

    //_loadItems();
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItem.indexOf(item);
    setState(() {
      _groceryItem.remove(item);
    });

    final url = Uri.https('flutter-prep-761b5-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');

    //to check error messagge we are adding async and await
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _groceryItem.insert(index, item);
      });
    }
  }

  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        'No Items added yet',
        style: TextStyle(fontSize: 15),
      ),
    );

    // if (_isLoading) {
    //   content = const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }

    // if (_groceryItem.isNotEmpty) {
    //   content = ListView.builder(
    //     itemCount: _groceryItem.length,
    //     itemBuilder: (context, index) => Dismissible(
    //       onDismissed: (direction) {
    //         _removeItem(_groceryItem[index]);
    //       },
    //       key: ValueKey(_groceryItem[index].id),
    //       child: ListTile(
    //         title: Text(_groceryItem[index].name),
    //         leading: Container(
    //           height: 24,
    //           width: 24,
    //           color: _groceryItem[index].category.color,
    //         ),
    //         trailing: Text(_groceryItem[index].quantity.toString()),
    //       ),
    //     ),
    //   );
    // }

    // if (_error != null) {
    //   content = Center(
    //     child: Text(_error!),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Text('Your Groceriess'),
        actions: [IconButton(onPressed: addItem, icon: Icon(Icons.add))],
      ),
      body: FutureBuilder(
        future: _loadedItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No Items added yet',
                style: TextStyle(fontSize: 15),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Dismissible(
              onDismissed: (direction) {
                _removeItem(snapshot.data![index]);
              },
              key: ValueKey(snapshot.data![index].id),
              child: ListTile(
                title: Text(snapshot.data![index].name),
                leading: Container(
                  height: 24,
                  width: 24,
                  color: snapshot.data![index].category.color,
                ),
                trailing: Text(snapshot.data![index].quantity.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
