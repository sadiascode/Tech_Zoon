import 'package:flutter/material.dart';
import '../../home/widget/custom_search.dart';
import '../widget/product_card.dart';
import '../widget/product_filter_bar.dart';
import '../widget/sort_filter_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<String> categories = [
    "All",
    "Mobile",
    "Laptop",
    "Tablet",
    "Accessories",
  ];

  int selectedCategory = 0;
  String sortLabel = "Popular";

  final List<Map<String, dynamic>> allProducts = [
    {"name": "iPhone 15 Pro", "price": "\$999", "image": "assets/iphones.webp", "category": "Mobile"},
    {"name": "iPhone 15 Pro", "price": "\$999", "image": "assets/iphone.jpg", "category": "Mobile"},
    {"name": "Samsung S24", "price": "\$849", "image": "assets/samsung.webp","category": "Mobile"},
    {"name": "OnePlus 12", "price": "\$699", "image": "assets/oneplus.png", "category": "Mobile"},
    {"name": "MacBook Pro", "price": "\$1999", "image": "assets/mac.jpg", "category": "Laptop"},
    {"name": "ASUS ROG", "price": "\$1299","image": "assets/asus.jpg", "category": "Laptop"},
    {"name": "Dell XPS 15", "price": "\$1499","image": "assets/dells.jpg","category": "Laptop"},
    {"name": "ASUS ROG", "price": "\$1299","image": "assets/asuss.jpg", "category": "Laptop"},
    {"name": "iPad Pro", "price": "\$1099", "image": "assets/ipads.webp", "category": "Tablet"},
    {"name": "Samsung", "price": "\$869","image": "assets/tab.webp","category": "Tablet"},
    {"name": "Galaxy Tab S9", "price": "\$799","image": "assets/tab.png","category": "Tablet"},
    {"name": "AirPods Pro", "price": "\$249","image": "assets/airpods.png", "category": "Accessories"},
    {"name": "MagSafe Charger", "price": "\$39", "image": "assets/charger.webp", "category": "Accessories"},
    {"name": "Smart Watch", "price": "\$199", "image": "assets/watch.png", "category": "Accessories"},
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory == 0) {
      return allProducts;
    }
    final selectedCategoryName = categories[selectedCategory];
    return allProducts
        .where((p) => p["category"] == selectedCategoryName)
        .toList();
  }

  final Set<String> cartItems = {};

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
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined, 
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                if (cartItems.isNotEmpty)
                  Positioned(
                    right: 12,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2D7DFF),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartItems.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            SearchField(
              onChanged: (String p1) {},
              hintText: 'Search Products...',
            ),

            const SizedBox(height: 20),

            ProductFilterBar(
              filters: categories,
              selectedIndex: selectedCategory,
              onFilterSelected: (index) {
                setState(() {
                  selectedCategory = index;
                });
              },
            ),

            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.92,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(
                  name: product["name"],
                  price: product["price"],
                  icon: product["icon"],
                  tag: product["tag"],
                  rating: product["rating"],
                  isInCart: cartItems.contains(product["name"]),
                  onAddToCart: () {
                    setState(() {
                      if (cartItems.contains(product["name"])) {
                        cartItems.remove(product["name"]);
                      } else {
                        cartItems.add(product["name"]);
                      }
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}