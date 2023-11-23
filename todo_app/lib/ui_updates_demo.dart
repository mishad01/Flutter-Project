import 'package:flutter/material.dart';

class UIUpdatesDemo extends StatefulWidget {
  UIUpdatesDemo({super.key});
  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }

  State<UIUpdatesDemo> createState() {
    return _UIUpdateDemo();
  }
}

class _UIUpdateDemo extends State<UIUpdatesDemo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Do you understand how Flutter updates UIs?'),
        ],
      ),
    );
  }
}
