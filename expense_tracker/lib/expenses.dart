import 'package:expense_tracker/Models/expense_data_model.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';

class expenses extends StatefulWidget {
  expenses({super.key});
  @override
  State<expenses> createState() {
    return _expenses();
  }
}

class _expenses extends State<expenses> {
  final List<expense> _registeredExpenses = [
    expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    expense(
      title: 'Cinema',
      amount: 9.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("The Chart"),
        Expanded(child: expensesList(expenses: _registeredExpenses))
      ],
    ));
  }
}
