import 'package:expense_tracker_test/Model/ExpensesInfoData.dart';
import 'package:expense_tracker_test/Widgets/ExpenseList/Expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses});

  final List<ExpensesInfoData> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}
