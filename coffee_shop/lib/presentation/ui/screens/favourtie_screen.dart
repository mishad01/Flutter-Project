import 'package:flutter/material.dart';

class FavourtieScreen extends StatefulWidget {
  const FavourtieScreen({super.key});

  @override
  State<FavourtieScreen> createState() => _FavourtieScreenState();
}

class _FavourtieScreenState extends State<FavourtieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Favourite')),
    );
  }
}
