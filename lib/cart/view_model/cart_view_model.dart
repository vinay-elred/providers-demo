import 'package:flutter/material.dart';

class CartScreenViewModel with ChangeNotifier {
  String get radioApple => "Apple";
  String get radioOrange => "Orange";

  String _radioGroupValue = "Apple";

  String get radioGroupValue => _radioGroupValue;

  void setRadioGroupValue(String? val) {
    if (val == null) return;
    _radioGroupValue = val;
    notifyListeners();
  }
}
