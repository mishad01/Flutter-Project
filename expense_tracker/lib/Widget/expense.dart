import 'package:expense_tracker/Model/ExpenseDataInfo.dart';
import 'package:expense_tracker/Widget/ExpList/ExpenseList.dart';
import 'package:expense_tracker/Widget/NewExpense.dart';
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
  void addOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddexpense: addExpense),
    );
  }

  void addExpense(ExpenseDataInfo expense) {
    setState(() {
      registredExpens.add(expense);
    });
  }

  void removeExpense(ExpenseDataInfo expense) {
    final expenseIndex = registredExpens.indexOf(expense);
    setState(() {
      registredExpens.remove(expense);
    });
    //snackbar shows info message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registredExpens.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expneses Found. Start Adding Some'),
    );
    if (registredExpens.isNotEmpty) {
      mainContent = ExpenseList(
        expense: registredExpens,
        onRemoveExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              addOverlay();
            },
            icon: Icon(Icons.add)),
      ]),
      body: Column(
        children: [
          Text('The Chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
