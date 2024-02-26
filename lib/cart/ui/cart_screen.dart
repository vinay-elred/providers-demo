import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/view_model/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVM = context.read<CartScreenViewModel>().isAuth;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Center(
        child: Text("Auth is $cartVM, Please log-in"),
      ),
    );
  }
}
