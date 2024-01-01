import 'package:flutter/material.dart';

class categoriesScreen extends StatelessWidget {
  categoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
    ));
  }
}
