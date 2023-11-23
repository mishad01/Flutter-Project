import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Todo {
  Todo(this.text, this.priority);
  final String text;
  final Priority priority;
}

class keys extends StatefulWidget {
  const keys({super.key});

  @override
  State<StatefulWidget> createState() {
    return _keys();
  }
}

class _keys extends State<keys> {
  var order = 'asc';
  @override
  Widget build(BuildContext context) {
    return;
  }
}
