import 'package:favourite_places_app/model/place.dart';
import 'package:favourite_places_app/providers/user_places.dart';
import 'package:favourite_places_app/widget/image_input.dart';
import 'package:favourite_places_app/widget/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class AddPlaceScreen extends ConsumerStatefulWidget {
  AddPlaceScreen({
    super.key,
    // required this.onTap,
  });
  // void Function() onTap;
  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImages;
  PlaceLocation? _selectedLocation;

  void _savePlace() {
    final enteredText = _titleController.text;
    PlaceLocation? _selectedLocation;
    if (enteredText.isEmpty ||
        _selectedImages == null ||
        _selectedLocation == null) {
      return;
    }

    ref.read(UserPlacesProvider.notifier).addPlace(
          enteredText,
          _selectedImages!,
          _selectedLocation!,
        );
    Navigator.of(context).pop();
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
        title: Text('Add new place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(
                height: 10,
              ),
              ImageInput(
                onPickedImage: (image) {
                  _selectedImages = image;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              LocationInput(
                onSelectLocation: (location) {
                  _selectedLocation = location;
                },
              ),
              const SizedBox(
                height: 15,
              ),
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
