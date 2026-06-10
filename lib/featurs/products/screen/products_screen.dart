import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121215),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFF121215),
        title: const Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "Welcome to Product Page",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}