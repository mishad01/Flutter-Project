import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat
    .yMd(); //yMd() is a constructor function //It defines how the date wll be formated

const uuid = Uuid();

////It allows us to create custom type
enum Category { food, travle, leisure, work } //In this project we wanna have a custom type category,we wanna have ac ustom type category.

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travle: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};
class ExpenseDataInfo {
  ExpenseDataInfo({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //It genartes a unique string id

  final String title;
  final double amount;
  final String id;
  final DateTime date; //Here DataTime is a data type.
  final Category
      category; //If we pass value from function then there might be typo here for that we will use alternative.For that we will use a fixed set of allowed value

  String get formattedDate {
    return formatter.format(date);
  }
}
