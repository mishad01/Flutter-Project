import 'package:uuid/uuid.dart';

const uuid = Uuid();

////It allows us to create custom type
enum Category {
  food,
  travle,
  leisure,
  work,
} //In this project we wanna have a custom type category,we wanna have ac ustom type category.

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
}
