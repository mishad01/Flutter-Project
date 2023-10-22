import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  var enteredTtile = '';

  void saveTitleInput(String inputValue) {
    enteredTtile = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          onChanged: saveTitleInput, //To store value;
          maxLength: 50,
          decoration: const InputDecoration(label: Text('title')),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print(enteredTtile);
                },
                child: Text('Save Expense'))
          ],
        )
      ]),
    );
  }
}
