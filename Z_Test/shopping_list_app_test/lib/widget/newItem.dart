import 'package:flutter/material.dart';
import 'package:shopping_list_app_test/data/categories_data.dart';

class NewItem extends StatefulWidget {
  NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Item'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
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
                      initialValue: '1',
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
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
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
                                SizedBox(
                                  width: 10,
                                ),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Reset'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Add'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
