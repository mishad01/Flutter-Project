import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  AddPlaceScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
      ),
    );
  }
}
