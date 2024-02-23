import 'package:flutter/widgets.dart';

class HomeScreenViewModel with ChangeNotifier {
  Future<List<String>?> fetchData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return ["Apple", "orange"];
    } catch (e) {
      return null;
    }
  }
}
