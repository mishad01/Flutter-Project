import 'package:favourite_places_practice/model/place.dart';
import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
  PlaceListWidget({super.key, required this.place});
  final List<Place> place;
  @override
  Widget build(BuildContext context) {
    if (place.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: place.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          place[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
