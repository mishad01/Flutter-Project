import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  Place({
    required this.titile,
  }) : id = uuid.v4();
  final String id;
  final String titile;
}
