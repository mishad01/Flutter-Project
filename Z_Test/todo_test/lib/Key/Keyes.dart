import 'package:flutter/material.dart';
import 'package:todo_test/Key/checkable_todo_item.dart';

//import 'package:todo_test/key/todo.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todos = [
    const Todo(
      'Final Syllabus',
      Priority.urgent,
    ),
    const Todo(
      'Practice Problem Solving',
      Priority.normal,
    ),
    const Todo(
      'Explore courses',
      Priority.low,
    ),
    const Todo(
      'Note Lectures',
      Priority.low,
    ),
    const Todo(
      'Take Medicines',
      Priority.normal,
    ),
    const Todo(
      'Collect All Notes',
      Priority.urgent,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // for (final todo in _orderedTodos) TodoItem(todo.text, todo.priority),
              for (final todo in _orderedTodos)
                CheckableTodoItem(
                  key: ValueKey(todo.text),
                  //key: ObjectKey(todo.text),
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
