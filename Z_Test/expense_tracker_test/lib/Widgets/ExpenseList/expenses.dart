import 'package:expense_tracker_test/Model/ExpensesInfoData.dart';
import 'package:expense_tracker_test/Widgets/ExpenseList/Expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<ExpensesInfoData> registredExpenses = [
    ExpensesInfoData(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      ccategory: Category.work,
    ),
    ExpensesInfoData(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      ccategory: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('The Chart'),
          Expanded(child: ExpensesList(expenses: registredExpenses)),
        ],
      ),
    );
  }
}
