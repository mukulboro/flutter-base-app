import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.black
  ),
  useMaterial3: true,
);

ThemeData darkThemeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
  scaffoldBackgroundColor: Colors.red.shade300,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white
  ),
  useMaterial3: true,
);