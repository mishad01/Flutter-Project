import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/data/dummyData.dart';
import 'package:multiscreen_and_navigation_prac/widget/Category_Grid_Item.dart';

class categoriesScreen extends StatelessWidget {
  const categoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Your Category")),

      // Create a GridView widget, which is a scrollable grid of widgets.
      body: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // Set the number of items in each row (cross-axis) to 2
              // Define the width-to-height ratio of each grid item to be 3:2
              // Add spacing (20 pixels) between items in the same row
              // Add spacing (20 pixels) between rows in the grid
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            for (final category in availableCategories)
              CategoryGridItem(category: category),
          ]),
    );
  }
}
