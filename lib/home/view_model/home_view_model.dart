import 'package:flutter/widgets.dart';

class HomeScreenViewModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (count == 0) return;
    _count--;
    notifyListeners();
  }
}
