import 'package:favourite_places_practice/provider/user_places.dart';
import 'package:favourite_places_practice/screens/add_place.dart';
import 'package:favourite_places_practice/widget/price_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Place extends ConsumerWidget {
  Place({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(UserPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddPlaceScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: PlaceListWidget(place: userPlaces),
    );
  }
}
