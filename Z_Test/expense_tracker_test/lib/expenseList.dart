import 'package:expense_tracker_test/Model/expenseDataInfo.dart';
import 'package:expense_tracker_test/Widgets/expenses_list/expenseItem.dart';
import 'package:flutter/cupertino.dart';

class expenseList extends StatelessWidget {
  expenseList({super.key, required this.expenses});

  final List<expenseDataInfo> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => expenseItem(expenses[index]));
  }
}
