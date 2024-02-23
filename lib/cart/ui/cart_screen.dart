import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<int?>(
              builder: (context, value, child) {
                if (value == null) return const Text("No data");
                return Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
            const SizedBox(height: 50),
            const Text("Stream using Consumer"),
          ],
        ),
      ),
    );
  }
}
