import 'package:flutter/material.dart';

class AddPlaceScreen extends StatelessWidget {
  AddPlaceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(label: Text('Title')),
                controller: _titleController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('Add Place'))
            ],
          ),
        ),
      ),
    );
  }
}
