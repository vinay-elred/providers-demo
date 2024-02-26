import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/ui/cart_screen.dart';
import 'package:providers_demo/home/view_model/auth_view_model.dart';
import 'package:tuple/tuple.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVM = context.read<AuthScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<AuthScreenViewModel, Tuple2<bool, bool>>(
              builder: (context, value, child) {
                final isAuth = value.item1;
                final loading = value.item2;

                if (loading) {
                  return Column(
                    children: const [
                      LinearProgressIndicator(),
                      Text(
                        "Loading..",
                        textAlign: TextAlign.center,
                      )
                    ],
                  );
                }

                return ElevatedButton(
                  onPressed: () {
                    isAuth ? homeVM.simulateLogOut() : homeVM.simulateLogin();
                  },
                  child: Text(isAuth ? "Log-out" : "Log-in"),
                );
              },
              selector: (p0, p1) => Tuple2(p1.isAuth, p1.loading),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartScreen(),
              ));
        },
        child: const Icon(Icons.forward),
      ),
    );
  }
}
