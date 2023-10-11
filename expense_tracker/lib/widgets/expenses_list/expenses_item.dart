import 'package:expense_tracker/Models/expense_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class expenseItem extends StatelessWidget {
  const expenseItem(this.expense, {super.key});
  final expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      expense.title,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
