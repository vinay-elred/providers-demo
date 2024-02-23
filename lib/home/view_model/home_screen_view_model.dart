import 'package:flutter/material.dart';

class HomeScreenViewModel with ChangeNotifier {
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  List<String> _data = [];
  List<String> get data => List.unmodifiable(_data);

  void fetchData() async {
    if (_isFetching) return;

    _isFetching = true;
    notifyListeners();
    // simulate API hit
    await Future.delayed(const Duration(seconds: 2));
    _data = ["Apple", "Orange", "Papaya", "Banana", "Pomegranate"];
    _isFetching = false;
    notifyListeners();
  }

  void removeItem(int index) {
    _data.removeAt(index);
    notifyListeners();
  }

  @override
  void dispose() {
    _data.clear();
    super.dispose();
  }
}
