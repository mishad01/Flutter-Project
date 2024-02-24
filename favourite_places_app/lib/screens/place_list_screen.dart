import 'package:flutter/material.dart';

class PlaceListScreen extends StatefulWidget {
  PlaceListScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _PlaceListScreen();
  }
}

class _PlaceListScreen extends State<PlaceListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
    );
  }
}
