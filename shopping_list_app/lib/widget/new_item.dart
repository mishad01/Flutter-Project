import 'package:flutter/material.dart';

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
            TextField(
              maxLength: 50,
              decoration: InputDecoration(
                label: Text('Name'),
              ),
              // validator: (value) {
              //   return 'Demo..';
              // },
            ),
          ],
        )),
      ),
    );
  }
}
