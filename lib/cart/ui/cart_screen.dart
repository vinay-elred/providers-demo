import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/view_model/cart_view_model.dart';
import 'package:providers_demo/home/view_model/home_screen_view_model.dart';
import 'package:tuple/tuple.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Center(
        child: Selector<HomeScreenViewModel, List<String>>(
          builder: (context, data, _) {
            if (data.isEmpty) return const Text("No Data");

            return SizedBox(
              width: 200,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item,
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<HomeScreenViewModel>().removeItem(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            );
          },
          selector: (p0, p1) => p1.data,
        ),
      ),
    );
  }
}
