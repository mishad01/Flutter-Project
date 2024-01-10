import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    // TODO: implement createState
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic..'),
      ),
    );
  }
}
