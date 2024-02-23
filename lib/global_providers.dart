import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_demo/home/view_model/home_view_model.dart';

import 'cart/view_model/cart_view_model.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required this.rootApp});
  final Widget rootApp;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (_) => CartScreenViewModel(),)
      ],
      child: rootApp,
    );
  }
}
