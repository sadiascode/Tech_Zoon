import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Welcome to Product Page",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}