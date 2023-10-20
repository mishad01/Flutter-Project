import 'package:expense_tracker_test/Model/expenseDataInfo.dart';
import 'package:flutter/material.dart';

class expenseItem extends StatelessWidget {
  expenseItem(this.expense, {super.key});

  final expenseDataInfo expense;
  @override
  Widget build(BuildContext context) {
    return Card(child: Text(expense.title));
  }
}
