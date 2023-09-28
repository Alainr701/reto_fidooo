import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(onTap: onTap, child: const Text('Home Page')),
    ));
  }
}
