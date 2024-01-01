import 'package:flutter/material.dart';

class categoriesScreen extends StatelessWidget {
  const categoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Your Category")),

      // Create a GridView widget, which is a scrollable grid of widgets.
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                2, // Set the number of items in each row (cross-axis) to 2.
            childAspectRatio: 3 /
                2, // Define the width-to-height ratio of each grid item to be 3:2.
            crossAxisSpacing:
                20, // Add spacing (20 pixels) between items in the same row.
            mainAxisSpacing:
                20 // Add spacing (20 pixels) between rows in the grid.
            ),
        children: [
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "2",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "3",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "4",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "5",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
