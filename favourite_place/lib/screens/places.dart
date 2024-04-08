import 'package:favourite_place/screens/add_place.dart';
import 'package:favourite_place/widgets/place_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPlaceSreen(),
                    ));
              },
            ),
          ],
        ),
        body: PlacesList(places: []));
  }
}
