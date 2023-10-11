import 'package:uuid/uuid.dart';

const uuid = Uuid();

class expense {
  expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : string_id = uuid.v4();

  final String string_id;
  final String title;
  final double amount;
  final DateTime date;
}
