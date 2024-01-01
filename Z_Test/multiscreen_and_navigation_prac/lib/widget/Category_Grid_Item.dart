import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/categories.dart';
import 'package:multiscreen_and_navigation_prac/main.dart';
import 'package:multiscreen_and_navigation_prac/model/categoryModel.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Text(category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
    );
  }
}
