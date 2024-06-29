import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({
    super.key,
    required this.onAddTodo,
  });
  final Function(Todo) onAddTodo;
  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _fromkey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                    labelText: 'Title', hintText: 'Title'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionTEController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Description',
                ),
                maxLength: 200,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your Description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_fromkey.currentState!.validate()) {
                      Todo todo = Todo(_titleTEController.text.trim(),
                          _descriptionTEController.text.trim(), DateTime.now());
                      widget.onAddTodo(todo);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionTEController.dispose();
    _titleTEController.dispose();
  }
}
