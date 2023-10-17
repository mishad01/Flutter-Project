import 'package:uuid/uuid.dart';

const uuid = Uuid();

//enum is It allows us to create custom type ..Mainly we fixed a specific value for specific datatype.Without that value any other value wont be accepted  there
enum Category {
  food,
  trable,
  leisure,
  work
} //In this project we wanna have a custom type category,we wanna have ac ustom type category.

class expense {
  expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : string_id = uuid.v4(); //It genartes a unique string id

  final String string_id;
  final String title;
  final double amount;
  final DateTime date; //Here DataTime is a data type.
  final Category category;
}
