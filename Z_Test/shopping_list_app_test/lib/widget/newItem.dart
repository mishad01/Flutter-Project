import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app_test/data/categories_data.dart';
import 'package:shopping_list_app_test/model/categories_model.dart';
import 'package:shopping_list_app_test/model/groceryItems_model.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  //The GlobalKey is parameterized with the type FormState, which indicates that it will be associated with the state of a Form widget. FormState is the class that holds the state of the Form widget, including form data and validation.
  final _fromkey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.dairy]!;
  var _isSending = false;

  void _saveItem() {
    //_fromKey.currentState!.validate(); is saying: "Access the current state of the form associated with the _fromKey key, and then trigger the validation process for all the form fields within that form." This is commonly used when you want to validate user input in a form before proceeding with a form submission or any other action dependent on valid input
    if (_fromkey.currentState!.validate()) {
      _fromkey.currentState!.save();

      final url = Uri.https('flutter-prep2-7352f-default-rtdb.firebaseio.com',
          'shopping-list.json');

      http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory.title,
          },
        ),
      );

      // Navigator.of(context).pop(
      //   GroceryItem(
      //     id: DateTime.now().toString(),
      //     name: _enteredName,
      //     quantity: _enteredQuantity,
      //     category: _selectedCategory,
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Item'),
      ),
      body: Form(
        key: _fromkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Namee'),
                ),
                validator: (value) {
                  //value.trim(): This removes any leading or trailing whitespace from the
                  if (value == null ||
                      value.trim().length <= 1 ||
                      value.trim().length > 15) {
                    return 'Must be between 1 and 15 characters';
                  }
                  return null;
                },
                onSaved: (newValue) {
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
                        label: Text('Quantitiy'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        /*tryParse(value): This is a method call on the int type. The tryParse method attempts to parse the string value as an integer.If value can be successfully parsed into an integer, the method returns true, indicating success, and the parsed integer value is usually assigned to a variable.
                         If value cannot be parsed into an integer, the method returns false, */
                        if (value == null ||
                            int.tryParse(value) == null ||
                            int.parse(value)! <= 0) {
                          return 'Must be valid position number';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        //int.parse(value) it will throw an error and int.tryparse(value) returns null
                        _enteredQuantity = int.parse(newValue!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
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
                                  width: 10,
                                ),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        _selectedCategory = value!;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _fromkey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(onPressed: _saveItem, child: const Text('Add'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
