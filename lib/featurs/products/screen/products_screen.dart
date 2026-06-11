import 'package:flutter/material.dart';

import '../../../common/custom_color.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<String> categories = [
    "Mobile",
    "Laptop",
    "Tablet",
    "Accessories",
  ];

  int selectedCategory = 0;

  final List<Map<String, dynamic>> products = [
    {
      "name": "Nike Air Max",
      "price": "\$120",
      "image":
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "rating": "4.8",
    },
    {
      "name": "Apple Watch",
      "price": "\$299",
      "image":
      "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
      "rating": "4.9",
    },
    {
      "name": "iPhone 15",
      "price": "\$999",
      "image":
      "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      "rating": "4.7",
    },
    {
      "name": "MacBook Pro",
      "price": "\$1499",
      "image":
      "https://images.unsplash.com/photo-1517336714739-489689fd1ca8",
      "rating": "4.9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0F),

      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFF121215),
        title: const Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 15),

          //CustomSearch(),

          const SizedBox(height: 15),

          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding:
              const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final isSelected =
                    selectedCategory == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    margin:
                    const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : const Color(0xFF1A1A1D),
                      borderRadius:
                      BorderRadius.circular(30),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white60,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

        ],
      ),
    );
  }
}