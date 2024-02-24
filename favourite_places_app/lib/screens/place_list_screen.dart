import 'package:favourite_places_app/providers/user_places.dart';
import 'package:favourite_places_app/screens/add_place_screen.dart';
import 'package:favourite_places_app/widget/places_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListScreen extends ConsumerWidget {
  PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(UserPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPlaceScreen(),
                    ));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: PlaceListWidget(places: userPlaces),
    );
  }
}
