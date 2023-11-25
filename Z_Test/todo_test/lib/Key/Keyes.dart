import 'package:flutter/material.dart';
import 'package:todo_test/Key/todo.dart';

class Todo {
  Todo(this.text, this.priority);
  String text;
  Priority priority;
}

class keys extends StatefulWidget {
  @override
  _keys createState() {
    return _keys();
  }
}

class _keys extends State {
  var order = 'asc';
  final _todo = [
    Todo('Learing Flutter', Priority.urgent),
    Todo('Practice Flutter', Priority.normal),
    Todo('Explore other course', Priority.low),
  ];

  List<Todo> get orderedTodos {
    // Create a copy of the _todos list
    final sortedTodos = List.of(_todo);

    // Sort the copy of the todos list based on the comparison function
    sortedTodos.sort((a, b) {
      // Compare the text of todo 'a' with the text of todo 'b'
      final bComesAfterA = a.text.compareTo(b.text);

      // Determine the sorting order (ascending or descending) and return the result accordingly
      return order == 'asc' ? bComesAfterA : -bComesAfterA;
    });

    // Return the sorted list of todos
    return sortedTodos;
  }

  void changeOrder() {
    setState(() {
      order = order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: changeOrder,
          icon:
              Icon(order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward),
          label: Text('Sort ${order == 'asc' ? 'Descending' : 'Ascending'}'),
        ),
      ],
    );
  }
}
