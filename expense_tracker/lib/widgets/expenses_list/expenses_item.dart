import 'package:expense_tracker/Models/expense_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class expenseItem extends StatelessWidget {
  const expenseItem(this.expensee, {super.key});
  final expense expensee;
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
            Text(expensee.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expensee.amount.toStringAsFixed(2)}'),
                const Spacer(), //This gives side wise space like two text will go in two corner
                Row(
                  children: [
                    Icon(Icons.alarm),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      expensee.date.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
