import 'package:favourite_places_app/model/place.dart';
import 'package:favourite_places_app/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
  PlaceListWidget({
    super.key,
    required this.places,
  });
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
          child: Text(
        'No places added yet',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ));
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].images),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(place: places[index]),
          ));
        },
      ),
    );
  }
}
