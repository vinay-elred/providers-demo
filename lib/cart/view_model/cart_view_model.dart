import 'package:flutter/material.dart';

class CartScreenViewModel with ChangeNotifier {
  Stream<int> get stream {
    return Stream<int>.periodic(
      const Duration(seconds: 1),
      (computationCount) {
        return computationCount * 1;
      },
    ).take(11);
  }
}
