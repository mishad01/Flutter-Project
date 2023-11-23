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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: const Text("YES")),
                  TextButton(onPressed: () {}, child: const Text("NO")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
