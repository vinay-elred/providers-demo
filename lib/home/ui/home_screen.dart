import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/ui/cart_screen.dart';
import 'package:providers_demo/cart/view_model/cart_view_model.dart';
import 'package:providers_demo/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HomeScreenViewModel>(
              builder: (context, viewModel, _) {
                final data = viewModel.count.toString();
                return Text(
                  data,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            const Text("Counter Data"),
            const SizedBox(height: 50),
            const Text("Cart Data"),
            Consumer<CartScreenViewModel>(
              builder: (context, viewModel, _) {
                final data = viewModel.radioGroupValue;
                return Text(
                  data,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const CartScreen(),
          ));
        },
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
