import 'package:favourite_place_test/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

/*class UserPlaceNotifier extends StateNotifier<List<Place>> {
  // Initializing the state with an empty list.
  UserPlaceNotifier() : super(const []);
  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);
    state = [newPlace, ...state];
  } //method which will update the state
}
// Method to add a new place to the list.
// Creating a new Place object with the provided title.
// Updating the state by creating a new list with the new place added to the beginning,
// followed by the existing places.

final UserPlaceProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>(
    (ref) => UserPlaceNotifier());

/*The StateNotifierProvider is a generic provider provided by the Riverpod library for managing state with state notifier classes.
 When you create a StateNotifierProvider,
you essentially create a wrapper around a state notifier class that allows other parts of your application to read and interact with the state managed by that notifier.*/
*/

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []);
  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);
    state = [newPlace, ...state];
  }
}

final UserPlaceProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>(
  (ref) => UserPlaceNotifier(),
);
