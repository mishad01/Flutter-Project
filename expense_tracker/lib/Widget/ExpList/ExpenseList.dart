import 'package:expense_tracker/Model/ExpenseDataInfo.dart';
import 'package:expense_tracker/Widget/ExpList/ExpenseItem.dart';
import 'package:flutter/widgets.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(
      {super.key, required this.expense, required this.onRemoveExpense});
  List<ExpenseDataInfo> expense;

  final void Function(ExpenseDataInfo expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expense[index]),
          onDismissed: (direction) {
            onRemoveExpense(expense[index]);
          },
          child: expenseItem(expense[index])),
    );
  }
}
