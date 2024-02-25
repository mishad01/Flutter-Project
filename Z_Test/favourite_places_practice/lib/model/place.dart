import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Place {
  Place({required this.title}) : id = uuid.v4();
  final String title;
  final String id;
}
