import 'package:crud_app/ui/product_list_screen.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud App',
      theme: _lightThemeData(),
      darkTheme: _dartThemeData(),
      themeMode: ThemeMode.system,
      home: const ProductListScreen(),
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white),
      ),
    );
  }

  ThemeData _dartThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white),
      ),
    );
  }
}
