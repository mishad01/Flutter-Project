//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiscreen_navigation/data/dummy_data.dart';
import 'package:multiscreen_navigation/screens/meals.dart';
import 'package:multiscreen_navigation/widget/catagory_grid_item.dart';

class categoriesScreen extends StatelessWidget {
  categoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    //MaterialPageRoute(builder: builder) it gives us route that can bepushed to stack
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: "Some Title",
          meals: [],
        ),
      ),
    ); //Navigation basically works with screen stack
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ), // "gridDelegate:"" controls the layout of grid view item
        //"SliverGridDelegateWithFixedCrossAxisCount" It means that, I can in the end, set the number of coloumns
        children: [
          //availableCategories.map((category)=>CategoryGridItem(category : category)).tolist())
          for (final category in availableCategories)
            categoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context);
              },
            )
        ],
      ),
    );
  }
}
