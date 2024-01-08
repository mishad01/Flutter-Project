import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    required this.icon,
  });
  final String id;
  final String title;
  final Color color;
  final IconData icon;
}
