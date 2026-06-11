import 'package:flutter/material.dart';
import 'custom_card.dart';

class FeaturedProductsSection extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final String sectionTitle;

  const FeaturedProductsSection({
    super.key,
    required this.products,
    this.sectionTitle = "Featured Products",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        products.isEmpty
            ? _buildEmpty()
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.92,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CustomCard(
                    name: product["name"],
                    price: product["price"],
                    image: product["image"],
                  );
                },
              ),
      ],
    );
  }

  Widget _buildEmpty() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D22),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, color: Colors.white38, size: 40),
            SizedBox(height: 10),
            Text(
              "No products found",
              style: TextStyle(color: Colors.white38, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
