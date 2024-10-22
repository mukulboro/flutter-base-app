import 'package:flutter/material.dart';
import 'package:flutter_base_app/screens/main_screen.dart';
import 'package:flutter_base_app/screens/settings_screen.dart';
import 'package:flutter_base_app/styles/theme_data.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base App',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: const MainScreen(),
    );
  }
}