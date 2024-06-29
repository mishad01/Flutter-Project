import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/screens/add_screen.dart';
import 'package:to_do_application/ui/screens/all_todo_list_screen.dart';
import 'package:to_do_application/ui/screens/done_todo_list_screen.dart';
import 'package:to_do_application/ui/screens/undone_todo_list_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin {
  List<Todo> _todoList = [];
  //late TabController _tabController;
  @override
  // void initState() {
  //   _tabController = TabController(length: 3, vsync: this);
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
          // controller: _tabController,
          children: [
            AllTodoListTab(
              onDelete: (int d) {
                _deleteTodo(d);
              },
              onStatusChange: (int ind) {
                _toggleTodoStatus(ind);
              },
              todoList: _todoList,
            ),
            DoneTodoListTab(
              onDelete: (int d) {
                _deleteTodo(d);
              },
              onStatusChange: (int ind) {
                _toggleTodoStatus(ind);
              },
              todoList: _todoList
                  .where(
                    (element) => element.isDone == true,
                  )
                  .toList(),
            ),
            UndoneTodoListTab(
              onDelete: (int d) {
                _deleteTodo(d);
              },
              onStatusChange: (int ind) {
                _toggleTodoStatus(ind);
              },
              todoList: _todoList
                  .where(
                    (element) => element.isDone == false,
                  )
                  .toList(),
            ),
          ],
        ),
        floatingActionButton: buildAddTodoFAB(context),
      ),
    );
  }

  FloatingActionButton buildAddTodoFAB(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTodo(
                onAddTodo: (p0) {
                  _addNewTodo(p0);
                },
              ),
            ));
      },
      tooltip: 'Add New Todo',
      label: const Text('Add'),
      icon: const Icon(Icons.add),
    );
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  TabBar _buildTabBar() {
    return TabBar(
      //controller: _tabController,
      tabs: [
        Tab(text: 'All'),
        Tab(text: 'Done'),
        Tab(text: 'Undone'),
      ],
    );
  }

  void _deleteTodo(int index) {
    _todoList.remove(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
