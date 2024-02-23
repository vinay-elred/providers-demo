import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/ui/cart_screen.dart';
import 'package:providers_demo/cart/view_model/cart_view_model.dart';

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
            Selector<CartScreenViewModel, int>(
              builder: (context, appleCount, _) {
                final data = appleCount.toString();
                return Text(
                  data,
                  style: const TextStyle(fontSize: 20),
                );
              },
              selector: (p0, p1) => p1.appleCount,
            ),
            const Text("Apple Count"),
            const SizedBox(height: 50),
            Selector<CartScreenViewModel, int>(
              builder: (context, orangeCount, _) {
                final data = orangeCount.toString();
                return Text(
                  data,
                  style: const TextStyle(fontSize: 20),
                );
              },
              selector: (p0, p1) => p1.orangeCount,
            ),
            const Text("Orange Count"),
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
