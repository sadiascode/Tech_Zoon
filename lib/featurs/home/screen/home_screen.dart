import 'package:flutter/material.dart';
import '../widget/banner_widget.dart';
import '../widget/category_section.dart';
import '../widget/custom_search.dart';
import '../widget/featured_products_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.phone_android, "title": "Mobile"},
    {"icon": Icons.laptop_mac, "title": "Laptop"},
    {"icon": Icons.tablet_android, "title": "Tablet"},
    {"icon": Icons.headphones, "title": "Accessories"},
  ];

  final List<Map<String, dynamic>> allProducts = [
    {"name": "iPhone 15 Pro", "price": "\$999", "image": "assets/iphones.webp", "category": "Mobile"},
    {"name": "iPhone 15 Pro", "price": "\$999", "image": "assets/iphone.webp", "category": "Mobile"},
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
    final selectedCategory = categories[_selectedCategoryIndex]["title"];
    return allProducts
        .where((p) => p["category"] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121215),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121215),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 26),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2D7DFF),
                    shape: BoxShape.circle,
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


            SearchField(
              onChanged: (String val) {},
              hintText: 'Search Mobile, Laptop...',
            ),

            const SizedBox(height: 20),


            const BannerWidget(),

            const SizedBox(height: 25),


            const Text(
              "Categories",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(height: 15),


            CategorySection(
              categories: categories,
              selectedIndex: _selectedCategoryIndex,
              onCategorySelected: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),

            const SizedBox(height: 25),

            FeaturedProductsSection(
              sectionTitle:
                  "${categories[_selectedCategoryIndex]["title"]} Products",
              products: filteredProducts,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}