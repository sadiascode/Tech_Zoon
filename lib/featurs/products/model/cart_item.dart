// Cart item model
class CartItem {
  final String name;
  final String price;
  final dynamic icon; // IconData
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.icon,
    this.quantity = 1,
  });

  double get priceValue =>
      double.tryParse(price.replaceAll('\$', '').replaceAll(',', '')) ?? 0;

  double get totalPrice => priceValue * quantity;
}
