import 'package:expense_tracker/Model/ExpenseDataInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddexpense});
  final void Function(ExpenseDataInfo expense) onAddexpense;
  @override
  State<StatefulWidget> createState() {
    return _NewExpanse();
  }
}

class _NewExpanse extends State<NewExpense> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  DateTime? SelectedDate;
  Category selectedCategory = Category.food;
  @override
  void dispose() {
    titleControler.dispose();
    amountControler.dispose();
  }

  void submitExpenseData() {
    final enteredAmont = double.tryParse(amountControler.text);
    bool valid = enteredAmont == null || enteredAmont <= 0;
    if (titleControler.text.trim().isEmpty || valid || SelectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Input Title, Amount or Date Correctly'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Okay')),
          ],
        ),
      );
      return;
    }
    widget.onAddexpense(ExpenseDataInfo(
        title: titleControler.text,
        amount: enteredAmont,
        date: SelectedDate!,
        category: selectedCategory));
    Navigator.pop(context);
  }

  void presentDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate =
        DateTime(initialDate.year - 1, initialDate.month, initialDate.day);
    final pickdate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: initialDate);
    setState(() {
      SelectedDate = pickdate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: titleControler,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountControler,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(SelectedDate == null
                      ? 'Select Date'
                      : formatter.format(SelectedDate!)),
                  IconButton(
                      onPressed: presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                          value: e, child: Text(e.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              //Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: submitExpenseData,
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
