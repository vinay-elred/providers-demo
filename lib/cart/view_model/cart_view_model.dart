import 'package:flutter/material.dart';

class CartScreenViewModel with ChangeNotifier {
  String get radioApple => "Apple";
  String get radioOrange => "Orange";

  int _appleCount = 0;
  int get appleCount => _appleCount;

  void incremenApple() {
    _appleCount++;
    notifyListeners();
  }

  void decrementApple() {
    if (appleCount == 0) return;
    _appleCount--;
    notifyListeners();
  }

  int _orangeCount = 0;
  int get orangeCount => _orangeCount;

  void incrementOrange() {
    _orangeCount++;
    notifyListeners();
  }

  void decrementOrange() {
    if (_orangeCount == 0) return;
    _orangeCount--;
    notifyListeners();
  }
}
