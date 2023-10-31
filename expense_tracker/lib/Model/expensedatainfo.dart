import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travle, leisure, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining_outlined,
  Category.leisure: Icons.movie,
  Category.travle: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class ExpenseDataInfo {
  ExpenseDataInfo({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  //If we wanna add extra constructor function this is how we can do this
  ExpenseBucket.forCategory(List<ExpenseDataInfo> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  List<ExpenseDataInfo> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      //here this expenses from 39 number
      sum += expense.amount;
    }

    return sum;
  }
}
