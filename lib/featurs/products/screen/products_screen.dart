import 'package:flutter/material.dart';

import '../../home/widget/custom_search.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        "name": "iPhone 15 Pro",
        "price": "\$999",
      },
      {
        "name": "Samsung S24 Ultra",
        "price": "\$1099",
      },
      {
        "name": "MacBook Pro",
        "price": "\$1499",
      },
      {
        "name": "Dell XPS 15",
        "price": "\$1299",
      },
      {
        "name": "iPad Air",
        "price": "\$699",
      },
      {
        "name": "AirPods Pro",
        "price": "\$249",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121215),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121215),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [

            SearchField(onChanged: (String p1) {  }, hintText: 'Search products...',),

            const SizedBox(height: 15),

            /// Category Buttons
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryChip("All", true),
                  _categoryChip("Mobile", false),
                  _categoryChip("Laptop", false),
                  _categoryChip("Tablet", false),
                  _categoryChip("Accessories", false),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Product Grid
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .68,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1D22),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        /// Product Image
                        Stack(
                          children: [
                            Container(
                              height: 140,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.devices,
                                  size: 50,
                                  color: Colors.white54,
                                ),
                              ),
                            ),

                            Positioned(
                              right: 15,
                              top: 15,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius:
                                  BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Text(
                            products[index]["name"]!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const Spacer(),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Text(
                            products[index]["price"]!,
                            style: const TextStyle(
                              color: Color(0xFF205090),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 42,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                const Color(0xFF205090),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _categoryChip(
      String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF205090)
            : const Color(0xFF1D1D22),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}