import 'package:favourite_places_practice/provider/user_places.dart';
import 'package:favourite_places_practice/widget/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  AddPlaceScreen({super.key});
  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  void _savePlace() {
    final _enteredText = _titleController.text;
    if (_enteredText.isEmpty) {
      return;
    }
    ref.read(UserPlacesProvider.notifier).addPlace(_enteredText);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 10),
              ImageInput(),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                  onPressed: _savePlace,
                  icon: Icon(Icons.add),
                  label: Text('Add Place'))
            ],
          ),
        ),
      ),
    );
  }
}
