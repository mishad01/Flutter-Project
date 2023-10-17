import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  trable,
  leisure,
  work
} //It allows us to create custom type  //It genartes a unique string id

class expense {
  expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : string_id = uuid.v4();

  final String string_id;
  final String title;
  final double amount;
  final DateTime date; //Here DataTime is a data type.
  final Category category;
}
