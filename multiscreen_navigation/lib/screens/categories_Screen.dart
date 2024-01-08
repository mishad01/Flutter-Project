import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multiscreen_navigation/data/dummy_data.dart';
import 'package:multiscreen_navigation/widgets/category_grid.dart';

class categoriesScreen extends StatelessWidget {
  categoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              categoryGridItem(category: category),
          ],
        ),
      ),
    );
  }
}
