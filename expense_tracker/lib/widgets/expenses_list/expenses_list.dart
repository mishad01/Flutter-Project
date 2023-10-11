import 'package:expense_tracker/Models/expense_data_model.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class expensesList extends StatelessWidget {
  expensesList({super.key, required this.expenses});

  final List<expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, //Because of this.If the length is 2 then
      itemBuilder: (context, index) => expenseItem(
        expenses[index],
      ), //Theb this function will be call twice
    ); //ListViews are always scrollable list by deafult
  }
}