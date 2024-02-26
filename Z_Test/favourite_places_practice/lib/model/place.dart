import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

Uuid uuid = Uuid();

class Place {
  Place({
    required this.title,
    required this.image,
  }) : id = uuid.v4();
  final String title;
  final String id;
  final File image;
}
