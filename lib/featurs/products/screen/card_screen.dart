import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';


class CardScreen extends StatefulWidget {

  const CardScreen({super.key,});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  // Dummy data for cart
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Sony Wireless Headphones",
      "price": 299.99,
      "image": "assets/images/product1.png",
      "quantity": 1,
    },
    {
      "name": "Apple MacBook Pro 14\"",
      "price": 1999.00,
      "image": "assets/images/product2.png",
      "quantity": 2,
    },
    {
      "name": "Logitech MX Master 3S",
      "price": 99.99,
      "image": "assets/images/product3.png",
      "quantity": 1,
    },
  ];

  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  double get tax => subtotal * 0.05;
  double get total => subtotal + tax;

  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      parentTabIndex: 1,
      backgroundColor: const Color(0xFF0D0D0F),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFF121215),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                cartItems.clear();
              });
            },
            icon: Icon(Icons.delete_outline, color: Colors.white.withValues(alpha: 0.7)),
          )
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.white.withValues(alpha: 0.2)),
                  const SizedBox(height: 20),
                  const Text(
                    "Your cart is empty",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Looks like you haven't added anything yet.",
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 14),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return _buildCartItem(item, index);
                    },
                  ),
                ),
                _buildCheckoutBottomBar(),
              ],
            ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D22),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Product Image Placeholder
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF252530),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Center(
              child: Icon(Icons.image_outlined, color: Colors.white54, size: 30),
            ),
          ),
          const SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "\$${item['price'].toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color(0xFF2D7DFF),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Quantity Controls
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF252530),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      item['quantity']++;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ),
                Text(
                  "${item['quantity']}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (item['quantity'] > 1) {
                        item['quantity']--;
                      } else {
                        cartItems.removeAt(index);
                      }
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.remove, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCheckoutBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF121215),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 14)),
                Text("\$${subtotal.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tax (5%)", style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 14)),
                Text("\$${tax.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(color: Colors.white12, height: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("\$${total.toStringAsFixed(2)}", style: const TextStyle(color: Color(0xFF2D7DFF), fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D7DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
