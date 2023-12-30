import 'package:flutter/material.dart';

class categoriesScreen extends StatelessWidget {
  categoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick your category'),),
      body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ), // "gridDelegate:"" controls the layout of grid view item
      //"SliverGridDelegateWithFixedCrossAxisCount" It means that, I can in the end, set the number of coloumns 
      children: [],
      ) ,
    );
  }
}
