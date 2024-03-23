import 'package:favourite_place_test/model/place.dart';
import 'package:favourite_place_test/screens/map_screen.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  PlaceDetailScreen({super.key, required this.place});

  final Place place;

  String get locationImage {
    final lat = place.location.latitude;
    final lang = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lang&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lang&key=AIzaSyA3J7tqEiKrtuD8we-79vle91XVDlFuAlI';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  //allows us if there is not tapable option
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MapScreen(
                          location: place.location, isSelecting: false),
                    ));
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(locationImage),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
