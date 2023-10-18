import 'package:expense_tracker/Model/expensedatainfo.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<ExpenseDataInfo> expenses;

  @override
  Widget build(BuildContext context) {
    //List view is like column but we use this when we dont know how many data can be there
    // return ListView.builder(
    //   itemCount: expenses.length,
    //   itemBuilder: (context, index) => Text(expenses[index].title),
    // );
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}
