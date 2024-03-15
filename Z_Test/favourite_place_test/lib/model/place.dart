import 'dart:io';
import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  Place({
    required this.title,
    required this.images,
  }) : id = uuid.v4();

  final String title;
  final String id;
  final File images;
}
