import 'package:multiscreen_and_navigation_prac/data/dummyData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
