import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String theme;

  ThemeProvider({required this.theme});

  ThemeMode getTheme(){
    if(theme == "system"){
      return ThemeMode.system;
    } else if(theme == "light"){
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void setTheme({required String newTheme}) async {
    theme = newTheme;
    notifyListeners();
  }
}
