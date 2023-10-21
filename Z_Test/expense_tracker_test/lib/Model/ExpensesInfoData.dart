import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class ExpensesInfoData {
  ExpensesInfoData({
    required this.title,
    required this.amount,
    required this.date,
    required this.ccategory,
  }) : id = uuid.v4();

  String id;
  String title;
  double amount;
  DateTime date;
  Category ccategory;

  String get formattedDate {
    return formatter.format(date);
  }
}
