import 'package:expense_tracker/Model/expensedatainfo.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<ExpenseDataInfo> _regestredExpenses = [
    ExpenseDataInfo(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseDataInfo(
      title: 'Cinema',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("The Chart"),
        Expanded(child: ExpensesList(expenses: _regestredExpenses)),
      ]),
    );
  }
}
