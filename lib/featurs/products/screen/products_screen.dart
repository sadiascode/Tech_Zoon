import 'package:flutter/material.dart';
import '../../home/widget/custom_search.dart';
import '../model/cart_item.dart';
import '../provider/cart_provider.dart';
import '../screen/cart_screen.dart';
import '../widget/product_card.dart';
import '../widget/product_filter_bar.dart';
import '../widget/sort_filter_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int _selectedFilterIndex = 0;
  String _searchQuery = '';
  final List<String> _sortOptions = ["Popular", "Price ↑", "Price ↓", "Newest"];
  int _selectedSortIndex = 0;

  final List<String> filters = [
    "All",
    "Mobile",
    "Laptop",
    "Tablet",
    "Accessories",
  ];

  final List<Map<String, dynamic>> allProducts = [
    {"name": "iPhone 15 Pro",      "price": "\$999",  "icon": Icons.phone_iphone,      "category": "Mobile",       "tag": "NEW",  "rating": 4.8},
    {"name": "Samsung S24 Ultra",  "price": "\$1099", "icon": Icons.phone_android,     "category": "Mobile",       "tag": "HOT",  "rating": 4.7},
    {"name": "OnePlus 12",         "price": "\$699",  "icon": Icons.smartphone,        "category": "Mobile",       "tag": "",     "rating": 4.5},
    {"name": "Pixel 8 Pro",        "price": "\$799",  "icon": Icons.phone_in_talk,     "category": "Mobile",       "tag": "SALE", "rating": 4.4},
    {"name": "MacBook Pro M3",     "price": "\$1999", "icon": Icons.laptop_mac,        "category": "Laptop",       "tag": "NEW",  "rating": 4.9},
    {"name": "Dell XPS 15",        "price": "\$1299", "icon": Icons.laptop,            "category": "Laptop",       "tag": "",     "rating": 4.5},
    {"name": "ASUS ROG Zephyrus",  "price": "\$1599", "icon": Icons.laptop_chromebook, "category": "Laptop",       "tag": "HOT",  "rating": 4.6},
    {"name": "iPad Pro M2",        "price": "\$1099", "icon": Icons.tablet_mac,        "category": "Tablet",       "tag": "NEW",  "rating": 4.7},
    {"name": "Galaxy Tab S9",      "price": "\$849",  "icon": Icons.tablet_android,   "category": "Tablet",       "tag": "",     "rating": 4.4},
    {"name": "AirPods Pro 2",      "price": "\$249",  "icon": Icons.headphones,        "category": "Accessories",  "tag": "HOT",  "rating": 4.8},
    {"name": "MagSafe Charger",    "price": "\$39",   "icon": Icons.cable,             "category": "Accessories",  "tag": "",     "rating": 4.2},
    {"name": "Apple Watch Ultra",  "price": "\$799",  "icon": Icons.watch,             "category": "Accessories",  "tag": "NEW",  "rating": 4.7},
  ];

  List<Map<String, dynamic>> get filteredProducts {
    List<Map<String, dynamic>> result = List.from(allProducts);

    if (_selectedFilterIndex != 0) {
      final category = filters[_selectedFilterIndex];
      result = result.where((p) => p["category"] == category).toList();
    }

    if (_searchQuery.isNotEmpty) {
      result = result
          .where((p) => p["name"]
              .toString()
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    if (_selectedSortIndex == 1) {
      result.sort((a, b) => _parsePrice(a["price"]).compareTo(_parsePrice(b["price"])));
    } else if (_selectedSortIndex == 2) {
      result.sort((a, b) => _parsePrice(b["price"]).compareTo(_parsePrice(a["price"])));
    } else if (_selectedSortIndex == 3) {
      result = result.reversed.toList();
    }

    return result;
  }

  double _parsePrice(String price) =>
      double.tryParse(price.replaceAll('\$', '').replaceAll(',', '')) ?? 0;

  void _showSortSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1D1D22),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sort By",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ..._sortOptions.asMap().entries.map((entry) {
              final bool isSelected = entry.key == _selectedSortIndex;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedSortIndex = entry.key);
                  Navigator.pop(ctx);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF2D7DFF).withValues(alpha: 0.15)
                        : const Color(0xFF121215),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF2D7DFF)
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.sort_rounded,
                          color: isSelected
                              ? const Color(0xFF2D7DFF)
                              : Colors.white38,
                          size: 18),
                      const SizedBox(width: 12),
                      Text(
                        entry.value,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF2D7DFF)
                              : Colors.white70,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      if (isSelected)
                        const Icon(Icons.check_rounded,
                            color: Color(0xFF2D7DFF), size: 18),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);
    final products = filteredProducts;

    return Scaffold(
      backgroundColor: const Color(0xFF121215),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121215),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_bag_outlined,
                      color: Colors.white, size: 26),
                  if (cart.totalCount > 0)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2D7DFF),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "${cart.totalCount}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),

            SearchField(
              onChanged: (val) => setState(() => _searchQuery = val),
              hintText: 'Search products...',
            ),

            const SizedBox(height: 15),

            ProductFilterBar(
              filters: filters,
              selectedIndex: _selectedFilterIndex,
              onFilterSelected: (index) =>
                  setState(() => _selectedFilterIndex = index),
            ),

            const SizedBox(height: 15),

            SortFilterWidget(
              totalCount: products.length,
              sortLabel: _sortOptions[_selectedSortIndex],
              onSortTap: _showSortSheet,
            ),

            const SizedBox(height: 12),

            Expanded(
              child: products.isEmpty
                  ? _buildEmptyState()
                  : GridView.builder(
                      itemCount: products.length,
                      padding: const EdgeInsets.only(bottom: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final p = products[index];
                        return ProductCard(
                          name: p["name"],
                          price: p["price"],
                          icon: p["icon"],
                          tag: p["tag"] ?? '',
                          rating: (p["rating"] as num).toDouble(),
                          isInCart: cart.isInCart(p["name"]),
                          onAddToCart: () {
                            if (!cart.isInCart(p["name"])) {
                              cart.addItem(CartItem(
                                name: p["name"],
                                price: p["price"],
                                icon: p["icon"],
                              ));
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      const Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                          size: 18),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          "${p["name"]} added to cart",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const CartScreen()),
                                          );
                                        },
                                        child: const Text(
                                          "View Cart",
                                          style: TextStyle(
                                              color: Color(0xFF90BEFF),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: const Color(0xFF1D7A3F),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else {
                              // Navigate to cart if already added
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CartScreen()),
                              );
                            }
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Color(0xFF1D1D22),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search_off_rounded,
                color: Colors.white24, size: 50),
          ),
          const SizedBox(height: 16),
          const Text(
            "No products found",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Try a different keyword or category",
            style: TextStyle(color: Colors.white24, fontSize: 13),
          ),
        ],
      ),
    );
  }
}