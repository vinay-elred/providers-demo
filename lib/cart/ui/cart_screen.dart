import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/view_model/cart_view_model.dart';
import 'package:tuple/tuple.dart';

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
            Selector<CartScreenViewModel, Tuple2<int, int>>(
              builder: (context, tuple, child) {
                final apple = tuple.item1.toString();
                final orange = tuple.item2.toString();

                return Column(
                  children: [
                    Text(
                      "Apple $apple",
                      style: const TextStyle(fontSize: 20),
                    ),
                    child!,
                    Text(
                      "Orange $orange",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                );
              },
              selector: (p0, p1) => Tuple2(p1.appleCount, p1.orangeCount),
              child: const SizedBox(height: 10),
            ),
            const SizedBox(height: 50),
            const Text("Increase/Decrease Apple"),
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
            const Text("Increase/Decrease Orange"),
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
