import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';

class NewItem extends StatefulWidget {
  NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  void savedItem() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //
              //"Textfileld or TextFormField" is widget used for diplaying an input field where user can type and enter some values
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  //.trim(): This is a method that removes leading and trailing whitespaces from the string.
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 15) {
                    return 'Must be between 1 and 15 characters';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      validator: (value) {
                        //int.tryParse(value): This is a method commonly used in programming languages like C# to attempt to convert a string (value) to an integer.
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be valid position number-';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  //If we wanna convert a map into list then we use ".entries"
                  Expanded(
                    child: DropdownButtonFormField(items: [
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
                              SizedBox(
                                width: 6,
                              ),
                              Text(category.value.title),
                            ],
                          ),
                        )
                    ], onChanged: (value) {}),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('Reset')),
                  ElevatedButton(onPressed: savedItem, child: Text('Add Item'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
