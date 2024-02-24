import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatefulWidget {
  PlaceDetailScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _PlaceDetailScreen();
  }
}

class _PlaceDetailScreen extends State<PlaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
      ),
    );
  }
}
