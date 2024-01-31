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
  void savedItem() {
    if (_formKey.currentState!.validate()) {
      //If validate return true then this "_formKey.currentState!.save();" will execute
      _formKey.currentState!.save();
      //Uri (Uniform Resource Identifier) using the http constructor in Flutter. This Uri is used to represent a Uniform Resource Locator (URL).
      final url = Uri.http('flutter-prep-761b5-default-rtdb.firebaseio.com/');
      http.post(url);
      Navigator.of(context).pop(
        GroceryItem(
            id: DateTime.now().toString(),
            name: _enteredName,
            quantity: _enteredQuanity,
            category: _selectedCategory),
      );
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
                    onPressed: savedItem,
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
