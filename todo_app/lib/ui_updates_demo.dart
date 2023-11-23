import 'package:flutter/material.dart';
import 'package:todo_app/demo_button.dart';

class UIUpdatesDemo extends StatefulWidget {
  UIUpdatesDemo({super.key});
  @override
  StatefulElement createElement() {
    print('UIUpdateDemo Create Element Called');
    return super.createElement();
  }

  State<UIUpdatesDemo> createState() {
    return _UIUpdateDemo();
  }
}

class _UIUpdateDemo extends State<UIUpdatesDemo> {
  var isunderstood = false;
  @override
  Widget build(BuildContext context) {
    print('UIUpdateDemo BUILD Called');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Do you understand how Flutter updates UIs?'),
            const SizedBox(height: 10),
            DemoButtons(),
          ],
        ),
      ),
    );
  }
}
