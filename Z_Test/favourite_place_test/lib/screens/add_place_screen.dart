import 'package:favourite_place_test/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  void _savedPlace() {
    final enteredText = _titleController.text;

    if (enteredText == null || enteredText.isEmpty) {
      return;
    }
    setState(() {
      ref.read(UserPlaceProvider.notifier).addPlace(enteredText);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(label: Text('Title')),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                  onPressed: _savedPlace,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'))
            ],
          ),
        ),
      ),
    );
  }
}
