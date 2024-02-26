import 'package:flutter/widgets.dart';

class AuthScreenViewModel with ChangeNotifier {
  bool _isAuth = false;
  bool _isLoading = false;

  bool get isAuth => _isAuth;
  bool get loading => _isLoading;

  void simulateLogin() async {
    _setLoader(true);
    await Future.delayed(const Duration(seconds: 2));
    _isAuth = true;
    _setLoader(false);
  }

  void simulateLogOut() async {
    _setLoader(true);
    await Future.delayed(const Duration(seconds: 2));
    _isAuth = false;
    _setLoader(false);
  }

  void _setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
