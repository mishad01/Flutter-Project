import 'package:expense_tracker_test/Model/expenseDataInfo.dart';
import 'package:expense_tracker_test/Widgets/expenseList.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<expenseDataInfo> _registredExpenses = [
    expenseDataInfo(
      title: 'Flutter Course',
      ammount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    expenseDataInfo(
      title: 'Cinema',
      ammount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('CHART'),
          Expanded(
            child: expenseList(
              expenses: _registredExpenses,
            ),
          )
        ],
      ),
    );
  }
}
