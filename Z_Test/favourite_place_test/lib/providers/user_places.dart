import 'package:favourite_place_test/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

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

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationCacheDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);

    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT, lat REAL,lng REAL, address TEXT)');
    }, version: 1);
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });

    state = [newPlace, ...state];
  }
}

final UserPlaceProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>(
  (ref) => UserPlaceNotifier(),
);
