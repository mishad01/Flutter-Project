import 'dart:io';

import 'package:favourite_places_practice/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  PlaceDetailsScreen({
    super.key,
    required this.place,
  });

  //File Image;
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
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}
