import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String languageCode;

  LanguageProvider({required this.languageCode});

  void setLanguage({required String newLanguageCode}) async {
    languageCode = newLanguageCode;
    notifyListeners();
  }
}