import 'package:flutter/material.dart';
import 'package:providers_demo/global_providers.dart';
import 'package:providers_demo/home/auth/auth_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalProviders(
      rootApp: MaterialApp(
        home: AuthScreen(),
      ),
    );
  }
}
