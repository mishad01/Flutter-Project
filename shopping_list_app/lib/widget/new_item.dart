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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
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
                return 'Demo..';
              },
            ),
            Row(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Quantity'),
                  ),
                  initialValue: '1',
                ),
                SizedBox(
                  width: 8,
                ),
                //If we wanna convert a map into list then we use ".entries"
                DropdownButtonFormField(items: [
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
                        ))
                ], onChanged: (value) {})
              ],
            ),
          ],
        )),
      ),
    );
  }
}
