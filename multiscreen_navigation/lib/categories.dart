import 'package:flutter/material.dart';

class categoriesScreen extends StatelessWidget {
  categoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ), // "gridDelegate:"" controls the layout of grid view item
        //"SliverGridDelegateWithFixedCrossAxisCount" It means that, I can in the end, set the number of coloumns
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
