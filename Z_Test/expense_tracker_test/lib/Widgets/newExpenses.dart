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

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

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
          //onChanged: saveTitleInput, //To store value;
          controller: titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text('title')),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: amountController,
                decoration:
                    InputDecoration(prefixText: '\$', label: Text('Amount')),
              ),
            )
          ],
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.value);
                },
                child: Text('Save Expense'))
          ],
        )
      ]),
    );
  }
}
