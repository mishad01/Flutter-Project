import 'package:favourite_place_test/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceListScreen extends StatelessWidget {
  PlaceListScreen({super.key});
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
      //body: ,
    );
  }
}
