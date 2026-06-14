import 'package:flutter/material.dart';

final ValueNotifier<List<Map<String, dynamic>>> globalCartItems = ValueNotifier([]);

void addToCart(Map<String, dynamic> product) {
  final currentCart = globalCartItems.value;
  final existingIndex = currentCart.indexWhere((p) => p['name'] == product['name']);
  
  if (existingIndex >= 0) {
    currentCart[existingIndex]['quantity'] += 1;
    globalCartItems.value = List.from(currentCart);
  } else {
    final newProduct = Map<String, dynamic>.from(product);
    newProduct['quantity'] = 1;
    // Price in ProductsScreen is formatted as "$999". We need double for calculation.
    String priceStr = newProduct['price'].toString().replaceAll('\$', '').replaceAll(',', '');
    newProduct['price'] = double.tryParse(priceStr) ?? 0.0;
    
    globalCartItems.value = [...currentCart, newProduct];
  }
}

void updateQuantity(int index, int delta) {
  final currentCart = List<Map<String, dynamic>>.from(globalCartItems.value);
  final newQuantity = currentCart[index]['quantity'] + delta;
  
  if (newQuantity > 0) {
    currentCart[index]['quantity'] = newQuantity;
    globalCartItems.value = currentCart;
  } else {
    currentCart.removeAt(index);
    globalCartItems.value = currentCart;
  }
}

void clearCart() {
  globalCartItems.value = [];
}
