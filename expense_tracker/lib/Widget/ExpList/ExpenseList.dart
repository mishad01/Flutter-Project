import 'package:expense_tracker/Model/ExpenseDataInfo.dart';
import 'package:expense_tracker/Widget/ExpList/ExpenseItem.dart';
import 'package:flutter/widgets.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expense});
  List<ExpenseDataInfo> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => expenseItem(expense[index]),
    );
  }
}
