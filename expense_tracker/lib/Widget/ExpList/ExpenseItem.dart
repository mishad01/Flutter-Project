import 'package:expense_tracker/Model/ExpenseDataInfo.dart';
import 'package:flutter/material.dart';

class expenseItem extends StatelessWidget {
  expenseItem(this.expense, {super.key});
  ExpenseDataInfo expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(
          expense.title,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text('\$${expense.amount.toStringAsFixed(2)}'),
            Spacer(),
            Row(
              children: [
                Icon(categoryIcon[expense.category]),
                Text(expense.formattedDate)
              ],
            )
          ],
        )
      ]),
    );
  }
}
