import 'package:flutter/material.dart';

class CartScreenViewModel with ChangeNotifier {
  CartScreenViewModel(this.isAuth);
  final bool isAuth;
}
