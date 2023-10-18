import 'package:expense_tracker/Model/expensedatainfo.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final ExpenseDataInfo expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(children: [
          Text(expense.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(), //This gives side wise space like two text will go in two corner
              Row(
                children: [
                  Icon(Icons.alarm),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expense.date.toString()),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
