import 'package:flutter/cupertino.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/widgets/empty_list_widget.dart';
import 'package:to_do_application/ui/widgets/todo_item.dart';

class AllTodoListTab extends StatelessWidget {
  const AllTodoListTab({
    super.key,
    required this.onDelete,
    required this.onStatusChange,
    required this.todoList,
  });

  final List<Todo> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    print(todoList.isEmpty);
    if (todoList.isEmpty) {
      return EmptyListWidget();
    }
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        Todo todo = todoList[index];
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            onDelete(index);
          },
          child: TodoItem(
            // todo: Todo('Title', 'description', DateTime.now()),
            todo: todoList[index],
            onIconButtonPressed: () {
              onStatusChange(index);
            },
          ),
        );
      },
    );
  }
}
