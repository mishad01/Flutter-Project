import 'package:favourite_places_app/model/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
// class UserPlacesNotfier extends StateNotifier<List<Place>> {
//   UserPlacesNotfier() : super(const []);

//   void addPlace(String title) {
//     final newPlace = Place(title: title);
//     state = [newPlace, ...state]; //spread old list into new list
//   }
// } //Now we have a method that will update the state

// //Now we need to set provider
// final UserPlacesProvider =
//     StateNotifierProvider<UserPlacesNotfier, List<Place>>(
//   (ref) => UserPlacesNotfier(),
// );

class UserPlacesNotfier extends StateNotifier<List<Place>> {
  UserPlacesNotfier() : super(const []);

  void addPlace(String text, File image) {
    final newPlace = Place(title: text, images: image);

    state = [newPlace, ...state];
  }
}

final UserPlacesProvider =
    StateNotifierProvider<UserPlacesNotfier, List<Place>>(
  (ref) => UserPlacesNotfier(),
);
