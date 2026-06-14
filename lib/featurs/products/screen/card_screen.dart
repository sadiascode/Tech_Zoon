import 'package:flutter/material.dart';
import 'package:my_app/featurs/products/screen/checkout_screen.dart';
import '../../../common/app_shell.dart';
import '../../../common/cart_state.dart';
import '../../../common/custom_button.dart';

class CardScreen extends StatefulWidget {

  const CardScreen({super.key,});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

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
              _showClearCartDialog(context);
            },
            icon: Icon(Icons.delete_outline, color: Colors.red.withValues(alpha: 0.7)),
          )
        ],
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: globalCartItems,
        builder: (context, cartItems, child) {
          return cartItems.isEmpty
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
                    _buildCheckoutBottomBar(cartItems),
                  ],
                );
        },
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
          // Product Image
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF252530),
              borderRadius: BorderRadius.circular(13),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                item['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.image_outlined, color: Colors.white54, size: 30));
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Quantity Controls in the same row as Name
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF252530),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              updateQuantity(index, -1);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Icon(Icons.remove, color: Colors.white, size: 16),
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
                              updateQuantity(index, 1);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Icon(Icons.add, color: Colors.white, size: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${(item['price'] is String ? double.tryParse(item['price']) ?? 0.0 : item['price']).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Color(0xFF2D7DFF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () => _showDeleteDialog(context, index, item['name'], item['quantity']),
                      child: const Icon(Icons.delete_outline, color: Colors.red, size: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // checkout section widget
  Widget _buildCheckoutBottomBar(List<Map<String, dynamic>> cartItems) {
    double subtotal = cartItems.fold(0, (sum, item) {
      double price = item['price'] is String ? double.tryParse(item['price']) ?? 0.0 : item['price'];
      return sum + (price * item['quantity']);
    });
    double tax = subtotal * 0.05;
    double total = subtotal + tax;

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
            CustomButton(text:"Checkout",  onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const CheckoutScreen()),
              );},
            ),
          ],
        ),
      ),
    );
  }

  // popup
  void _showDeleteDialog(BuildContext context, int index, String productName, int quantity) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1D1D22),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Remove Item", style: TextStyle(color: Colors.white)),
          content: Text("Are you sure you want to remove $productName from your cart?", style: TextStyle(color: Colors.white70)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.white54)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                updateQuantity(index, -quantity); 
                Navigator.pop(context);
              },
              child: const Text("Remove", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showClearCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1D1D22),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Clear Cart", style: TextStyle(color: Colors.white)),
          content: const Text("Are you sure you want to remove all items from your cart?", style: TextStyle(color: Colors.white70)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.white54)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                clearCart();
                Navigator.pop(context);
              },
              child: const Text("Clear All", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
