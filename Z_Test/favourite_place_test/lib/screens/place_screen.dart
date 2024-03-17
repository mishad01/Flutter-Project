import 'package:favourite_place_test/screens/add_place_screen.dart';
import 'package:favourite_place_test/widget/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceScreen extends StatelessWidget {
  PlaceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPlaceScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: PlaceList(places: []),
    );
  }
}
