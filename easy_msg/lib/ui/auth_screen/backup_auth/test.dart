import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidgets(
      child: Text('Hello'),
    );
  }
}
