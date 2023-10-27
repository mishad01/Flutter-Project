import 'package:expense_tracker/Model/ExpenseDataInfo.dart';
import 'package:expense_tracker/Widget/ExpList/ExpenseList.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  List<ExpenseDataInfo> registredExpens = [
    ExpenseDataInfo(
        title: 'Flutter Course',
        amount: 10.12,
        date: DateTime.now(),
        category: Category.work),
    ExpenseDataInfo(
        title: 'Burger',
        amount: 5.12,
        date: DateTime.now(),
        category: Category.food),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ]),
      body: Column(
        children: [
          Text('The Chart'),
          Expanded(
              child: ExpenseList(
            expense: registredExpens,
          )),
        ],
      ),
    );
  }
}