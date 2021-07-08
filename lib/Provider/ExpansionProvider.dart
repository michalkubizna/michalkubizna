import 'package:flutter/material.dart';

class ExpansionProvider extends ChangeNotifier {
  List<String> texts = [];

  bool isButtonRegion = false;
  
  void expand(List<String> texts, bool isButtonRegion) {
    this.texts = texts;

    this.isButtonRegion = isButtonRegion;

    notifyListeners();
  }
}