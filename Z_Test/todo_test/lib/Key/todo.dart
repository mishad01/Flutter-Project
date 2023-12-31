import 'package:flutter/material.dart';

enum Priority { urgent, normal, low }

class TodoItem extends StatelessWidget {
  TodoItem(this.text, this.priority, {super.key});
  final String text;
  final Priority priority;
  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;
    if (priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }
    if (priority == Priority.normal) {
      icon = Icons.list;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 12,
          ),
          Text(text),
        ],
      ),
    );
  }
}
