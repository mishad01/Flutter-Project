import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category {
  food,
  travle,
  leisure,
  work,
}

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travle: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class expenseDataInfo {
  expenseDataInfo({
    required this.title,
    required this.ammount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String title;
  final double ammount;
  final String id;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
