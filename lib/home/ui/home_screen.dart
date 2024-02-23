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
            Consumer<List<String>?>(
              builder: (context, data, _) {
                if (data == null) return const CircularProgressIndicator();

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Text(
                      data[index],
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 50),
            const Text("Future provider"),
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
