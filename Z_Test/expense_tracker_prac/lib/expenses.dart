import 'package:expense_tracker_prac/expenseList.dart';
import 'package:expense_tracker_prac/expense_structure.dart';
import 'package:flutter/material.dart';

class expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _expenses();
  }
}

class _expenses extends State<expenses> {
  final List<expenseStruc> registeredExpenses = [
    expenseStruc(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    expenseStruc(
      title: "Cinema",
      amount: 9.99,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        children: [
          Text("The Chart"),
          SizedBox(
            height: 10,
          ),
          expenseList(expenses: registeredExpenses),
        ],
      ),
    );
  }
}
