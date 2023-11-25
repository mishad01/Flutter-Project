import 'package:flutter/material.dart';

enum Priority { urgent, normal, low }

class CheckableTodoItem extends StatefulWidget {
  CheckableTodoItem(this.text, this.priority, {super.key});
  final String text;
  final Priority priority;

  @override
  State<StatefulWidget> createState() {
    return _CheckableTodoItem();
  }
}

class _CheckableTodoItem extends State<CheckableTodoItem> {
  var done = false;

  void setDone(bool? ischecked) {
    setState(() {
      done = ischecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;
    if (widget.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }
    if (widget.priority == Priority.normal) {
      icon = Icons.list;
    }

    return Row(
      children: [
        Checkbox(value: done, onChanged: setDone),
        const SizedBox(width: 6),
        Icon(icon),
        const SizedBox(width: 12),
        Text(widget.text),
      ],
    );
  }
}
