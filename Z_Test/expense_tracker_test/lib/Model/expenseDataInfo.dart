import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travle,
  leisure,
  work,
}

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
}
