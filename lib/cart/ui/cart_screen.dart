import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/view_model/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVM = context.read<CartScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
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
            const Text("Increase/Decrease Count"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: cartVM.incremenApple,
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: cartVM.decrementApple,
                  icon: const Icon(Icons.remove),
                )
              ],
            ),
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
            const Text("Increase/Decrease Count"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: cartVM.incrementOrange,
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: cartVM.decrementOrange,
                  icon: const Icon(Icons.remove),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
