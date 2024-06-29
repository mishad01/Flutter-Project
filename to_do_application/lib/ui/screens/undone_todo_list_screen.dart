import 'package:flutter/cupertino.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/widgets/empty_list_widget.dart';
import 'package:to_do_application/ui/widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab(
      {super.key,
      required this.todoList,
      required this.onDelete,
      required this.onStatusChange});
  final List<Todo> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    if (todoList.isEmpty) {
      return EmptyListWidget();
    }
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            onDelete(index);
          },
          child: TodoItem(
              todo: todoList[index],
              onIconButtonPressed: () {
                onStatusChange(index);
              }),
        );
      },
    );
  }
}
