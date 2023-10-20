import 'package:expense_tracker_test/Model/expenseDataInfo.dart';
import 'package:flutter/material.dart';

class expenseItem extends StatelessWidget {
  expenseItem(this.expense, {super.key});

  final expenseDataInfo expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        children: [
          Text(expense.title),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text('\$${expense.ammount.toStringAsFixed(2)}'),
              const Spacer(),
              Text(expense.date.toString()),
            ],
          )
        ],
      ),
    ));
  }
}
