import 'package:expense_tracker/Widget/expense.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

var kdarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 9, 99, 125));
void main(List<String> args) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          cardTheme: CardTheme().copyWith(
            color: kdarkColorScheme.secondaryContainer,
            margin: EdgeInsets.all(10),
          )),
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      home: Expenses(),
    ),
  );
}
