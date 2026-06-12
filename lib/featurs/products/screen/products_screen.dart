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
    {"name": "iPhone 17 Pro Max", "price": "\$999", "image": "assets/iphones.webp", "tag": "NEW", "rating": 4.8, "category": "Mobile",},
    {"name": "iPhone 13 Pro Max", "price": "\$999", "image":  "assets/iphone.jpg", "tag": "NEW", "rating": 4.8, "category": "Mobile",},
    {"name": "Samsung S24 Ultra", "price": "\$849", "image": "assets/samsung.webp", "tag": "SALE", "rating": 4.6, "category": "Mobile",},
    {"name": "OnePlus 12", "price": "\$699", "image": "assets/oneplus.png", "tag": "", "rating": 4.5, "category": "Mobile",},
    {"name": "MacBook Pro M3", "price": "\$1999", "image": "assets/mac.jpg", "tag": "NEW", "rating": 4.9, "category": "Laptop",},
    {"name": "ASUS ROG Strix", "price": "\$1299", "image": "assets/asus.jpg", "tag": "", "rating": 4.7, "category": "Laptop",},
    {"name": "Dell XPS 15", "price": "\$1499", "image": "assets/dells.jpg", "tag": "SALE", "rating": 4.6, "category": "Laptop",},
    {"name": "ASUS ROG", "price": "\$1399", "image": "assets/asuss.jpg", "tag": "", "rating": 4.7, "category": "Laptop",},
    {"name": "iPad Pro 12.9", "price": "\$1099", "image": "assets/ipads.webp", "tag": "", "rating": 4.8, "category": "Tablet",},
    {"name": "Galaxy Tab S9", "price": "\$1099", "image": "assets/ipads.webp", "tag": "", "rating": 4.8, "category": "Tablet",},
    {"name": "Galaxy Tab", "price": "\$869","image": "assets/tab.webp", "tag": "NEW", "rating": 4.5, "category": "Tablet",},
    {"name": "AirPods Pro", "price": "\$249", "image": "assets/airpods.png", "tag": "", "rating": 4.7, "category": "Accessories",},
    {"name": "MagSafe Charger", "price": "\$39", "image": "assets/charger.webp", "tag": "", "rating": 4.7, "category": "Accessories",},
    {"name": "Apple Watch Ultra", "price": "\$799", "image": "assets/watch.png", "tag": "NEW", "rating": 4.8, "category": "Accessories",},
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
                  image: product["image"],
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