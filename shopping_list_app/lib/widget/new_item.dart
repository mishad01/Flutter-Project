import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/model/categories_model.dart';
import 'package:shopping_list_app/model/groceryItems_model.dart';
import 'package:http/http.dart'
    as http; // Here as tells dart that all the content thats provided by this package should be bundled into as an objiect os this name here 'http'..then name can be different

class NewItem extends StatefulWidget {
  NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuanity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = Uri.https('flutter-prep-761b5-default-rtdb.firebaseio.com',
          'shopping-list.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'name': _enteredName,
            'quantity': _enteredQuanity,
            'category': _selectedCategory.title,
          },
        ),
      );
      //Status Code
      //201 = tells everything works
      //404,5xx = tells something went wrong
      print(response.body);
      print(response.statusCode);

      //context.mounted: The mounted property of the BuildContext is a boolean value that indicates whether the associated widget is currently part of the widget tree. If a widget is "mounted," it means that it is currently active and has not been removed or disposed of.
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop(); //Pop screen and go back
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().length <= 1 ||
                      value.trim().length > 15) {
                    return 'Must be between 1 and 15 characters';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue == null) {
                    return;
                  }
                  _enteredName = newValue!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuanity.toString(),
                      validator: (value) {
                        if (value == null ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be valid position number--';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        //int.parse(value); it will convert string to a number
                        _enteredQuanity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _selectedCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(category.value.title),
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        }),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: Text('Reset')),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text('Add Item'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
