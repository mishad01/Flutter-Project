import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  Place({
    required this.title,
    required this.image,
  }) : id = uuid.v4();

  final String title;
  final String id;
  final File image;
}
