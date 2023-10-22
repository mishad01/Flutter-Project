import 'package:expense_tracker_test/Model/ExpensesInfoData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

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
  DateTime? selectedDate;
  Category selectedCategory = Category.food;

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

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
            ),
            const SizedBox(
              width: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(selectedDate == null
                    ? 'No Date selected'
                    : formatter.format(selectedDate!)),
                IconButton(
                    onPressed: presentDatePicker,
                    icon: Icon(Icons.calendar_month))
              ],
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Row(
          children: [
            DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    selectedCategory = value;
                  });
                }),
            Spacer(),
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
