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
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
