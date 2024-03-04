import 'package:favourite_places_app/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  PlaceDetailScreen({
    super.key,
    required this.place,
  });
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      // body: Center(
      //   child: Text(
      //     place.title,
      //     style: Theme.of(context)
      //         .textTheme
      //         .bodyLarge!
      //         .copyWith(color: Theme.of(context).colorScheme.onBackground),
      //   ),
      // ),
      body: Stack(
        children: [
          Image.file(
            place.images,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}
