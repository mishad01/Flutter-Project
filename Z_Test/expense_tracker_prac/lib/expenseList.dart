import 'package:expense_tracker_prac/expense_structure.dart';
import 'package:expense_tracker_prac/expenses.dart';
import 'package:flutter/material.dart';

class expenseList extends StatelessWidget {
  expenseList({required this.expenses, super.key});

  List<expenseStruc> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(expenses[index].id),
    );
  }
}
