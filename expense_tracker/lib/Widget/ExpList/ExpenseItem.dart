import 'package:expense_tracker/Model/ExpenseDataInfo.dart';
import 'package:flutter/material.dart';

class expenseItem extends StatelessWidget {
  expenseItem(this.expense, {super.key});
  ExpenseDataInfo expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
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
      ),
    );
  }
}
