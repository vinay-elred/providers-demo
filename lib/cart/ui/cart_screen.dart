import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/view_model/cart_view_model.dart';
import 'package:providers_demo/home/view_model/home_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVM = context.read<HomeScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartScreenViewModel>(
              builder: (context, cartVM, child) {
                return Column(
                  children: [
                    RadioListTile(
                      value: cartVM.radioApple,
                      groupValue: cartVM.radioGroupValue,
                      onChanged: cartVM.setRadioGroupValue,
                      title: Text(cartVM.radioApple),
                    ),
                    RadioListTile(
                      value: cartVM.radioOrange,
                      groupValue: cartVM.radioGroupValue,
                      onChanged: cartVM.setRadioGroupValue,
                      title: Text(cartVM.radioOrange),
                    ),
                  ],
                );
              },
            ),
            Consumer<HomeScreenViewModel>(
              builder: (context, viewModel, _) {
                final data = viewModel.count.toString();
                return Text(
                  data,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            const Text("Increase/Decrease Count"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: homeVM.increment,
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: homeVM.decrement,
                  icon: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
