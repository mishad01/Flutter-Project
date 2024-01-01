import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors
        .orange, //we are giving default color so that if there is no color prsent then we will use the default one
  });
  final String id;
  final String title;
  final Color color;
}
