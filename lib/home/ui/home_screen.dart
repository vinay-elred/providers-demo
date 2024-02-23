import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/cart/ui/cart_screen.dart';
import 'package:providers_demo/home/view_model/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenViewModel homeVM = HomeScreenViewModel();

  @override
  void initState() {
    super.initState();
    Future.microtask(homeVM.fetchData);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenViewModel>.value(
      value: homeVM,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<HomeScreenViewModel>(
                  builder: (context, homeVM, _) {
                    if (homeVM.isFetching) {
                      return const CircularProgressIndicator();
                    }

                    if (homeVM.data.isEmpty) return const Text("Data error");

                    return SizedBox(
                      width: 200,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: homeVM.data.length,
                        itemBuilder: (context, index) {
                          final item = homeVM.data[index];
                          return Text(
                            item,
                            textAlign: TextAlign.center,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
                Text(
                  "List len : ${context.watch<HomeScreenViewModel>().data.length}",
                ),
                const SizedBox(height: 20),
                Text(
                  "List Contain Apple : ${context.select<HomeScreenViewModel, bool>(
                    (p) => p.data.contains("Apple"),
                  )}",
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeScreenViewModel>().fetchData();
                  },
                  child: const Text("Fetch Again"),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider.value(
                  value: homeVM,
                  child: const CartScreen(),
                ),
              ));
            },
            child: const Icon(Icons.navigate_next_outlined),
          ),
        );
      },
    );
  }
}
